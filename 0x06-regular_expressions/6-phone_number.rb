#!/usr/bin/env ruby
# this script reads from the command line
# prints string that contains only numbers
puts ARGV[0].scan(/\A\d+\Z/).join
