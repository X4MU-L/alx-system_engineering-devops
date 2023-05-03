#!/usr/bin/env ruby
# this script reads from the command line
# prints string matching "htn" and with more "t" in between
puts ARGV[0].scan(/hbt*n/).join
