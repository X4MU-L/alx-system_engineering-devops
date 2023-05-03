#!/usr/bin/env ruby
# this script reads from the command line
# prints only uppercase characters in a string
puts ARGV[0].scan(/[A-Z]/).join
