# This module contains all the methods required for displaying
# the string/binary in hexadecimal.
# This has module functions which can be directly called in the code that
# requires this ruby file or the gem. 
# The gem is at http://rubygems.org/gems/hex_dump and can be installed using
# $ gem install hex_dump
#
# @author Shivam Patel

module HexDump

  # foreground color constants
  BLACK   = 30 
  RED     = 31 
  GREEN   = 32 
  YELLOW  = 33 
  BLUE    = 34 
  MAGENTA = 35 
  CYAN    = 36 
  WHITE   = 37 
  
  # Takes a buffer and displays it in hexadecimal in a format described by the options
  # The optional options are :line_size and :hex_color
  # :line_size sets the size (width) of the hex display. Can be 16(default), 24, 32 or 64 
  # :hex_color sets the color of the foreground text. Can be a number between 30 to 37 (see codes above)
  # @param buffer [String] The actual binary data/string that is to be displayed in hex.
  # @param options [Hash] This can be blank (in that case defaults options will be used).
  #   Otherwise a hash providing any of the settings that are to be changed.
  #   Eg. to change line witdh, pass options as { line_size: 32 }
  #   to change both line width and the foreground color, pass options as { line_size: 32, hex_color: 34 }
  # @return [String] A string containing the entire hexdump. 
  def self.print(buffer = "", options = {})
    # merge(and overwrite) whatsoever options were passed by user
    options = {line_size: 16, hex_color: WHITE }.merge(options)
    
    line_size = options[:line_size]
    hex_color = options[:hex_color]
    
    line_size = 16 unless [16, 24, 32, 64].include?(line_size) # prevent user providing arbit line_size
    
    byte_number = 0
    lines = ''
    line_format = '%02x%02x ' * (line_size/2)
    buffer_length = buffer.length
    
    while byte_number < buffer_length
      line_number = (sprintf '%08x', byte_number) + ": " # print byte number padded with zeros on left
      
      if (buffer_length - byte_number) >= line_size
        characters = buffer.byteslice(byte_number, line_size)             # get a line size worth of characters
        unpacked_chars = characters.unpack("C#{line_size}")
        line_hex = send(:sprintf, line_format, *unpacked_chars )
      else
        len = buffer_length - byte_number
        characters = buffer.byteslice(byte_number, len)
        if len == 1
          whitespace_pads = " " * ((line_size * 2.5) - 2)   # this last line will only take 3 chars
          line_format = "%02x#{whitespace_pads}"
        else
          whitespace_pads = " " * ((line_size * 2.5) - (len * 2 ) - len/2 )
          line_format =  '%02x%02x ' * (len/2)  + '%02x' * (len % 2) + whitespace_pads
        end
        unpacked_chars = characters.unpack("C#{len}")
        line_hex = send(:sprintf, line_format, *unpacked_chars )
        
        line_size = len # for one last line, change the line_size
      end
      # replace all non printable chars with a '.' char
      line_char = unpacked_chars.map{ |c| c.chr}.join.tr("^\x20-\x7E", '.')
      
      line = line_number + "\e[#{hex_color}m" + line_hex + " " + line_char + "\e[0m"
      byte_number += line_size
      puts line
      lines += line
    end # end while
    return lines           # the entire hex dump
  end # end def print
  
end #end module
