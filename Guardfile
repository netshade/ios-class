guard :bundler do
  watch("Gemfile")
end
guard :shell, all_on_start: true do
  watch("schedule.yml") do
    `./seed.rb`
    "Regenerated slides"
  end
  watch /^(.+)\.tex$/i do |m|
    `./slides/regen #{File.dirname(File.expand_path(m[0]))}`
    "Regenerated #{m[0]} pdf"
  end
end
