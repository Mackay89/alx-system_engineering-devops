#!/usr/bin/env ruby

if ARGV.empty?
  puts "USAGE: #{$PROGRAM_NAME} <log_string>"
  exit 1
end

sender = ARGV[0].scan(/\[from:([^\]]+)\]/).flatten.first
reciver = ARGV[0].scan(/\[to:([^\]]+)\]/).flatten.first
flags = ARGV[0].scan(/\[flags:([^\]]+)\]/).flatten.first

puts "#{sender},#{reciever},#{flags}"
