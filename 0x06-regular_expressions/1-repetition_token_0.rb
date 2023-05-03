#!/usr/bin/env ruby
# this script reads from the command line
# matches the string "hbttn" or "t" repeated not more than 5 times
puts ARGV[0].scan(/hbt{2,5}n/).join
