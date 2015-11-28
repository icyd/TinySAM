# TinySam

This development board, is designed to be breadboard-pin compatible taking into
consideration size, easiness of production (using 2-sided pcb), and price.
The microcontroller implement for this board is the [Atmel's ARM Cortex-M0+ SAM D21](http://www.atmel.com/products/microcontrollers/arm/sam-d.aspx?tab=documents).

![Image of TinySAM](https://raw.githubusercontent.com/icyd/TinySAM/master/hardware/Picture1.png)


### Features:

  * 2 16-pins header connectors with 100 mils pitch, with connection to all the
  available pins of the microcontroller, VIN and GND; compatible with the pin
  layout of breadboards.
  * 32.786 Khz crystal for Real-time applications.
  * Cortex debug header (SWD).
  * ESD and VBUS protection.
  * Filter for USB connector.
  * RESET button with filter.
  * 2 LEDs interface (power and controlled by the microcontroller).
  * Smart toggle between power supplies (VBUS or VIN).
  * Landing pads for pogo pins (mass production).


### Power supply

The device could be powered using two different supplies: through **USB cable**
directly, of with an external supply of **6.5v MAX** connected to the **VIN pin**.
The device will select between USB and external supply, with preference for the
last one. Also *when a host USB cable is connected an external supply is
required* to power both 'TinySAM' and guest device.



## License

Ideas for the design taking from (attribution):

 * [Atmel's SAM D21 datasheet](http://www.atmel.com/Images/atmel-42129-sam-d20_datasheet.pdf)
 * [Sparkfun's SAMD21 Mini breakboard](https://www.sparkfun.com/products/13664)
 * [Atmel's SAMD21 Xplained Pro Evaluation kit](http://www.atmel.com/tools/ATSAMD21-XPRO.aspx)

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
