#!/usr/bin/env ruby

if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <string>"
  exit 1
end

uppercase_letter = ARGV[0].scan(/[A-Z]/).join

puts uppercase_letter
