#!/usr/bin/env ruby
require 'rubygems'
require 'erb'
require 'yaml'
require 'fileutils'


module MarkdownFraming

  def strip_front_space(markdown)
    markdown.gsub(/^(\s)\s+/m, "\\1")
  end

  def extensions
    [
      "+raw_tex",
      "+footnotes"
    ]
  end

  def markdown_to_beamer(slide, raw = true)
    to_format(slide, :beamer, raw)
  end

  def markdown_to_latex(content, raw = true)
    to_format(content, :latex, raw)
  end

  def to_format(markdown, fmt = :beamer, raw = true)
    return if markdown.nil? || markdown.strip.empty?
    unless raw
      markdown = strip_front_space(markdown).chomp
    end
    content = nil
    IO.popen("pandoc -f markdown_github#{extensions.join("")} -t #{fmt.to_s.inspect} --highlight-style kate", "r+") do |process|
      process.puts markdown
      process.close_write
      content = process.readlines.join("")
      process.close
    end
    content
  end

  def new_frame(name, content = nil)
    content = content.is_a?(Hash) ? content["slides"] : content
    Array(content).flatten.compact.map do |body|
      begin
        markdown_to_beamer(body.strip)
      rescue Exception => e
        raise body.inspect
      end
    end.compact.join("")
  end

  def string_to_title_frame(name)
    new_frame(name, <<-EOMD)
\\begin{center}
\\large #{name}
\\end{center}

    EOMD
  end

end

class ERBTemplate
  include MarkdownFraming

  attr_accessor :title, :subtitle, :author, :date, :sections, :filename, :listings, :bibliographies, :output_buffer

  def initialize
    self.output_buffer = ""
  end

  def render
    ERB.new(File.read(@filename || "slides/slides.template"), nil, nil, '@output_buffer').result(binding)
  end

  def with_output_buffer(buf = '') #:nodoc:
    self.output_buffer, old_buffer = buf, output_buffer
    yield
    output_buffer
  ensure
    self.output_buffer = old_buffer
  end

end

class ERBYamlTemplate
  include MarkdownFraming

  attr_accessor :listings, :bibliographies, :filename, :output_buffer, :listing_count, :assets

  def initialize
    self.listing_count = 0
    self.listings = { }
    self.bibliographies = { }
    self.output_buffer = ""
    self.assets = ["oxygen-header.png"]
  end

  def render
    ERB.new(File.read(@filename || "schedule.yml"), nil, nil, '@output_buffer').result(binding)
  end

  def auto_indent(indented_content, &block)
    sanitized = indented_content.gsub(/(^[\n\r]+|[\n\r]+$)/m, "\n")
    if sanitized =~ /^([ \t]+)/
      prelude = $1
      line_num = 0
      yield(sanitized).split(/[\n\r]/).collect do |line|
        (( (line_num += 1) == 1) || line.index(prelude)) ? line : prelude + line
      end.join("\n")
    else
      yield(sanitized)
    end
  end

  def listing(caption, name = nil, &block)
    self.listing_count += 1
    name ||= "listing:#{listing_count}"
    content = with_output_buffer(&block)
    if listings[name]
      self.output_buffer += "\\ref{#{name}"
    else
      listings[name] = auto_indent(content) do |str|
      <<-EOLISTING
\\begin{listing}[H]
  #{str}
  \\caption{#{caption}}
  \\label{#{name}}
\\end{listing}
   EOLISTING
      end
      self.output_buffer += listings[name]
   end
  end

  def listing_data
    #listings.join("\n")
    ""
  end

  def bibliography_data
    bibliographies.values.join("\n")
  end

  def code_block(language, &block)
    content = with_output_buffer(&block)
    self.output_buffer += auto_indent(content) do |str|
      <<-EOS
\\begin{minted}[resetmargins=true,fontsize=\\footnotesize]{#{language}}
#{str}
\\end{minted}
    EOS
    end
  end

  def figure(caption = nil, &block)
    content = with_output_buffer(&block)
    self.output_buffer += auto_indent(content) do |str|
      <<-EOS
\\begin{figure}[htb]
\\begin{center}
#{content}
\\caption{#{caption || "Figure"}}
\\end{center}
\\end{figure}
      EOS
    end
  end

  def graphic(image, scale = 1.0)
    self.assets << image
    "\\includegraphics[scale=#{scale}]{#{image}}"
  end

  def code_listing(caption, language, name = nil, &block)
    listing(caption, name) do
      code_block(language, &block)
    end
  end

  def itemize(*items)
    output = items.collect { |item| "\\item #{markdown_to_latex(item)}\n" }.join("\n")
    <<-EOS
\\begin{itemize}
#{output}
\\end{itemize}
    EOS
  end

  def descriptize(*items)
    output = Hash[*items].collect { |key, value| "\\item[#{key}] #{value}\n"}
    <<-EOS
\\begin{description}
#{output}
\\end{description}
    EOS
    ""
  end

  def bibliography(name, url, info = { })
    items = (info || { }).merge({
                                  :howpublished => "\\url{#{url}}"
                                })
    items = items.collect do |key, value|
      "#{key} = #{value.inspect}"
    end.join("\n")
    article = <<-EOARTICLE
@misc{#{name},
#{items}
}
    EOARTICLE
    bibliographies[name] ||= article
    "\\cite{#{name}}"
  end

  def highlight(txt)
    "\\highlighton{#{txt}}"
  end

  def alert(txt)
    "\\alert{#{txt}"
  end

  def block(name, &block)
    content = with_output_buffer(&block)
    self.output_buffer += auto_indent(content) do <<-EOS
\\begin{block}{#{name}}
#{markdown_to_latex(content, false)}
\\end{block}
EOS
    end
  end

  def alertblock(name, &block)
    content = with_output_buffer(&block)
    self.output_buffer += auto_indent(content) do |str|
      <<-EOS
\\begin{alertblock}{#{name}}
#{str}
\\end{alertblock}
    EOS
    end
  end

  def url(href)
    "\\url{#{href}}"
  end

  def with_output_buffer(buf = '') #:nodoc:
    self.output_buffer, old_buffer = buf, output_buffer
    yield
    output_buffer
  ensure
    self.output_buffer = old_buffer
  end

end

config = ERBYamlTemplate.new
data = YAML.load(config.render)
rendered_data = File.new("schedule.rendered.yml", "w+")
rendered_data.write(config.render)
rendered_data.close

data["presentations"].each_with_index do |data, index|
  base_dir = File.join("slides", (index+1).to_s)
  target = File.join(base_dir, "slides.tex")
  bib = File.join(base_dir, "slides.bib")

  FileUtils.mkdir_p(base_dir)
  File.delete(target) if File.exists?(target)
  File.delete(bib) if File.exists?(bib)

  template = ERBTemplate.new
  template.listings = config.listing_data
  template.bibliographies = config.bibliographies
  template.title = data["title"]
  template.subtitle = data["subtitle"]
  template.author = data["author"]
  template.date = data["date"]
  template.sections = data["sections"]
  template.filename = "slides/slides.template"

  fo = File.new(target, "w+")
  fo.write(template.render)
  fo.close

  bo = File.new(bib, "w+")
  bo.write(config.bibliography_data)
  bo.close

  template_name = "beamerthemeOxygen.sty"

  FileUtils.cp(File.join("slides", template_name), File.join(base_dir, template_name))

  config.assets.each do |asset|
    FileUtils.cp(File.join("assets", asset), File.join(base_dir, asset))
  end
end
