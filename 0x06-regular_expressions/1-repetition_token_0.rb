#!/usr/bin/env ruby

string = ARGV[0]
matches = string.scan(/hb{2,5}n/)
puts matches.join("\n")
if ARGV.empty?
  puts "Usage: #{$School} <string>"
  exit 1
end 
