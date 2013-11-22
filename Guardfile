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
    new_hash = `md5sum #{absolute_path}`.chomp
    if new_hash != file_hashes[absolute_path]
      file_hashes[absolute_path] = new_hash
      msg = "Regenerated #{m[0]} pdf"
      `./slides/regen #{File.dirname(absolute_path)}`
      n msg, "PDF"
      msg
    end
  end
end
