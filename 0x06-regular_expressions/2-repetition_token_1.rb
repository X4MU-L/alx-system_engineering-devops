#!/usr/bin/env ruby
# this script reads from the command line
# prints string matching "htn" or "hbtn"
puts ARGV[0].scan(/hb??tn/).join
