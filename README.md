Linux driver for the Altera SLD Hub (used for FPGA debugging over TCP)

MM DEBUG_LINK driver

Adapted from sld-hub driver written by Graham Moore (grmoore@altera.com)

Copyright (C) 2014 Altera Corporation. All rights reserved

This program is free software; you can redistribute it and/or modify it
under the terms and conditions of the GNU General Public License,
version 2, as published by the Free Software Foundation.

This program is distributed in the hope it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <http://www.gnu.org/licenses/>.

For more information:

http://rocketboards.org/foswiki/view/Projects/RemoteSystemDebug
https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/an/an_693.pdf

## Usage instructions:

* Instantiate the SLD Hub Controller System component in QSYS. The s0 port (Avalon slave) is connected to the HPS h2f_lw_axi_master.
* Record the address and optionally lock the address. Putting addresses on 4KiB boundaries is also recommended.
* Add the following in the device tree (where ADDR is the QSYS reported address):
```
sldhub_link: debugger@ADDR {
      #address-cells = <1>;
      #size-cells = <1>;
      compatible = "altr,mm-debug-link-1.0";
      reg = <ADDR 0x80>;
}; //end debugger@ADDR
```
