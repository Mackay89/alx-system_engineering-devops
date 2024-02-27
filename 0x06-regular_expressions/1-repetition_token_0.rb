#!/usr/bin/env ruby

if ARGV.empty?
  puts "Usage: #{$PROHRAM_NAME} <string>"
  exit 1
end

puts ARGV[0].scan(/hbt{2,5}n/).join
