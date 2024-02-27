#!/usr/bin/env ruby

string = ARGV[0]
matches = string.scan(/hb{2,5}n/)
puts maches.join("\n")
if ARGV.empty?
  puts "Usage: #($/hb{2,5}n/) <string>
  exit 1
end 
