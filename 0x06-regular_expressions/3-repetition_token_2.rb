#!/usr/bin/env ruby
# This script accept one argument and passe it to a regular expression matching method


puts ARGV[0].scan(/hbt{n,}/).join
