## Hex Dump

This is a ruby library (and a gem) which facilitates printing a hexadecimal dump of a given binary/string.

The example directory has sample usage of the library.

This is tested on Ruby versions 1.9.3 and above


### Usage
The usage of this library is very straightforward. Usage examples are shown below.

#### Get code
Install the gem (**preferred way**)
```shell
gem install hex_dump
```
of clone the code from github
```shell
git clone https://github.com/shivampatel/hex_dump.git
```

#### Require the gem

```shell
require 'hex_dump' 
```

#### Obtain the binary/string which you want to see in hex
```shell
contents = File.read("your_file.jpg") # dumping file
contents = socket.recv(1024) # or data from a network socket
```

#### View hex dump
```shell
# Display hex with default options

HexDump.print contents
```

```shell
# display hex in color Yellow.

HexDump.print contents, options={hex_color: HexDump::CYAN}
```

```shell
# display hex with line width 24 and foreground color green

HexDump.print contents, options={line_size: 24, hex_color: HexDump::GREEN}
```

#### Hex Dump options
HexDump takes options in the form of options hash. 
These are the options that can be passed to HexDump:

##### hex_color

Default is white. These are the values that hex_color can take:

* HexDump::CYAN
* HexDump::BLACK
* HexDump::RED
* HexDump::GREEN
* HexDump::YELLOW
* HexDump::BLUE
* HexDump::MAGENTA
* HexDump::CYAN
* HexDump::WHITE
 
#### line_size

line_size can be 16, 24, 32 or 64. Default is 16

#### delimiter

Delimiter is the character that delimits the line numbers and the hex characters. Default is ":". Users can pass any character or string to denote a different delimiter.

One use case of having different delimiters is to differentiate between different streams of data. Eg. differentiate between SSL data and plain text data in a hex stream of network but having delimiters as 'S' and ':' respectively.

