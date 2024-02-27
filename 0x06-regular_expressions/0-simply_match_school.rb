#!/usr/bin/env ruby

if ARGV.empty?
  puts "Usage: #($School) <string>"
  exit 1
end

string = ARGV[0]

pattern = /School/

matches = string.scan(pattern)

puts matches.join
