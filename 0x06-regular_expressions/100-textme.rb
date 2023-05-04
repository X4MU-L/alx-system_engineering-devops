#!/usr/bin/env ruby
# this script reads from the command line
# The script should output: [SENDER],[RECEIVER],[FLAGS]
# The sender phone number or name (including country code if present)
# The receiver phone number or name (including country code if present)
# The flags that were used
puts ARGV[0].scan(/\[from:(\+?\d{11}|[\s\S]*?)\]\s\[to:(\+?\d{11})\]\
\s\[flags:([\s\S]*?)\]/).join(",")
