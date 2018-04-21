require 'fileutils'

puts 'Pruning cached assets'

caches = Dir["#{ARGV.first}/assets-*"]

while caches.size > 20
  lru_cache = caches.min_by { |directory| IO.read "#{directory}/last_use" }
  puts "Prune directory #{lru_cache}"
  FileUtils.remove_dir lru_cache
  caches.delete lru_cache
end
