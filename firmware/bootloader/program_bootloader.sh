#!/bin/bash
usage ()
{
    echo -e 'Usage:
    \t--uart\tTo program just uart interface
    \t--usb\tTo program just USB CDC interface
    \t--both\tTo program both interfaces
    \n*NOTE: In case --uart and --usbcdc are both selected, both will be programmed\n'
    exit 0
}
if [ $# = 0 ]; then
    usage
fi
while [[ $# > 0 ]]
do
key="$1"

case $key in
	--uart)
	UART=true
	shift
	;;
	--usb)
	USB=true
	shift
	;;
	--both)
	BOTH=true
	shift;
	;;
    -h|--help)
    usage
    ;;
	*)
    usage
	;;
esac
done

if [[ "$BOTH" = true || ( "$USB" = true && "$UART" = true ) ]]; then
    file="samd21_sam_ba_both_interfaces.hex"
    echo "Programming both interaces with file: '$file'..."
elif [ "$UART" = true ]; then
    file="samd21_sam_ba_uart.hex"
    echo "Programming just UART inteface with file: '$file'..."
else
    file="samd21_sam_ba_usbcdc.hex"
    echo "Programming just USB interface with file: '$file'..."
fi

if [ ! -f "$file" ]; then
    echo "File '$file' does not exist, please check. Exiting!"
    exit 1
fi

sudo openocd -f interface/cmsis-dap.cfg -f target/at91samdXX.cfg -c "program $file verify reset exit"

if [ $? = 0 ]; then
    echo "Programming finished, existing."
    exit 0
else
    echo "Error ocurred, exiting!."
    exit 1
fi
