#!/usr/bin/env ruby
# This script accept one argument and passes it to a regular expression matching method

if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <string>"
  exit 1
end

puts ARGV[0].scan(/hbt{n,}/).join
