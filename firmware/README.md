# TinySam
## Firmware

The repository includes some firmware that could be used together with the board.

### Bootloader

Atmel's SAM-BA bootloader could be installed within the microcontroller and the
communication would be possible using either USB CDC driver, UART, or both
interfaces, depending on the firmware file installed on the
microcontroller. When just one interface is used (UART or USB), the application
would start at address 0x1000 (4096 bytes of memory used by the bootloader). If
both interfaces are implemented, the application would start at address 0x2000
(8192 bytes).

The bootloader is located in:

  * Both interfaces: `samd21_sam_ba_both_interfaces.hex`
  * Uart: `samd21_sam_ba_uart.hex`
  * USB: `samd21_sam_ba_usbcdc.hex`

To program the bootloader use `program_bootloader.sh` script included. Used
 ```./program_bootloader.sh --help``` to see the usage of the script.

To program the bootloader into the device a debugger/programmer tool is
necessary, and `OpenOCD` needs to be installed.

Once the bootloader is programmed, then you can communicate with it if:

  * There is no application programmed in the flash memory of the device.
  * When the device pin PA15 (24th pin of the device and the 8th pin of the
    connector J2 in the development board) is pulled down during
    microcontroller's reset.

In order to communicate with the bootloader, an application is needed. For
example, following could be used:
  * [Atmel SAM-BA In-system Programmer v2.15](http://www.atmel.com/tools/atmelsam-bain-systemprogrammer.aspx)
  * [BOSSA-arduino](https://github.com/shumatech/BOSSA/tree/arduino)

Is important to remember that you need to tell this application which is the
starting address for your device (either 0x1000 or 0x2000).


### Example: Blink test

Once bootloader is installed, an application could be programmer within the
flash memory on the device, in this case an application that blink the user led
on the development board. The source files are available with the repository in
case some modification is required (change output pin, change delay, etc).

If both communication interfaces are implemented, modify the *ROM* starting
address (to 0x2000) in the `samd21g18a_flash.ld` file.

To program the example application to the device just connect the development
port to the USB port and run `make install` (**NOTE: BOSSA-arduino is
required**)

****************************************************************************
Firmware Copyright (C):
    2015 - Alberto Vazquez aka IcyD

        This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
    (at your option) any later version.

        This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

        You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

****************************************************************************
