#!/usr/bin/env ruby
# this script reads from the command line
# prints string that starts with "h" contains characters class that are
#+ not tabs and spaces inbetween and ends with "N"
puts ARGV[0].scan(/\Ah[\s\S]n\Z/).join
