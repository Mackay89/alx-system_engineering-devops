#!/usr/bin/env ruby

if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <string>"
  exit 1
end

string = ARGV[0]

matches = string.scan(/hb{2,5}n/)

puts matches.join("\n")

