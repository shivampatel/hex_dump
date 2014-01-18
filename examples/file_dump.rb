# Hexadecimal dump of a binary (image) file.
# to run this file enter this on command line:
# $ ruby file_dump.rb

require '../lib/hex_dump.rb'

contents = File.read("img.png")  # read file into a string

# display hex with default options (line_size:16 and hex_color:HexDump::BLACK)
HexDump.print contents

# display hex in color Yellow. (default line_size:16 will be used 
# since it is not specified in options hash)
HexDump.print contents, options={hex_color: HexDump::CYAN}

# display hex with line width 24 and foreground color green
HexDump.print contents, options={line_size: 24, hex_color: HexDump::GREEN}
