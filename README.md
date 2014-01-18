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
# Display hex with default options (line_size:16 and hex_color:HexDump::BLACK)

HexDump.print contents
```

```shell
# display hex in color Yellow. (default line_size:16 will be used 
# since it is not specified in options hash)

HexDump.print contents, options={hex_color: HexDump::CYAN}
```

```shell
# display hex with line width 24 and foreground color green

HexDump.print contents, options={line_size: 24, hex_color: HexDump::GREEN}
```
