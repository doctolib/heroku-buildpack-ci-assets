require 'fileutils'
require 'time'

puts 'Pruning cached assets'
Dir["#{ARGV.first}/assets-*"]
  .sort_by { |directory| Time.parse(IO.read("#{directory}/last_use")) }
  .reverse.drop(20)
  .each do |cache_dir|
    puts "Prune directory #{cache_dir}"
    FileUtils.remove_dir cache_dir
  end
