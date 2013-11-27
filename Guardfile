file_hashes = {}

guard :bundler do
  watch("Gemfile")
end
guard :shell, all_on_start: true do
  watch("schedule.yml") do
    msg = "Regenerated slides"
    `./seed.rb`
    n msg, "YML"
    msg
  end
  watch /^(.+)\.tex$/i do |m|
    absolute_path = File.expand_path(m[0])
    absolute_dir = File.dirname(absolute_path)
    name = File.basename(absolute_path, ".tex")
    pdf_path = File.join(absolute_dir, name + ".pdf")
    new_hash = `md5sum #{absolute_path}`.chomp
    if new_hash != file_hashes[absolute_path]
      file_hashes[absolute_path] = new_hash
      msg = "Regenerated #{name} pdf"
      `./slides/regen #{absolute_dir}`
      `open #{pdf_path}`
      n msg, "PDF"
      msg
    end
  end
  watch /^code\/.+(\.[cmh])$/i do |m|
    n "Building", "Code"
    status = 0
    output = IO.popen("./build", chdir: "./code/") do |f|
      str = f.readlines.join
      f.close
      status = $?.to_i
      str
    end
    puts output
    if status == 0
      n "Success", "Code"
    else
      n "Failed (#{status})", "Code"
    end
  end
end
