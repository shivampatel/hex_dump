Gem::Specification.new do |s|
  s.name                  = 'hex_dump'
  s.version                = '1.0.0'
  s.date                  = '2014-01-17'
  s.summary         = "Hex Dump binaries and string from your ruby code"
  s.description     = "This gem allows programmers to hexdump arbitary strings and binaries. Helpful for your reverse engineering scripts. Has options like line_width and hex_colors which can help customize the format in which the resultant hexadecimal dump of the string or binary is displayed."
  s.authors                = ["Shivam Patel"]
  s.email                  = 'shivam@shivampatel.net'
  s.files                  = ['lib/hex_dump.rb'] + Dir['examples/*']
  s.homepage              = 'https://github.com/shivampatel/hex_dump'
  s.license                = 'MIT'
end
