#!/usr/bin/env ruby
# this script reads from the command line and matches "School"
puts ARGV[0].scan(/School/).join
