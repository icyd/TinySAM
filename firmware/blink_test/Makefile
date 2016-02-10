
#
# Makefile for c project of Atmel ATSAMD21G18A device
#

ifeq ($(shell uname), Linux)
	MKDIR = mkdir -p
endif

CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy
OBJDUMP=arm-none-eabi-objdump
SIZE=arm-none-eabi-size
PROG=bossac

OUTPUT_FOLDER=build
OUTPUT_FILE=blink_test

INCLUDE_PATHS=-I/usr/arm/Atmel/samd21a/include/ -I/usr/arm/CMSIS/Include/
CFLAGS=-x c -mthumb -mcpu=Cortex-M0plus -D__SAMD21G18A__ -O0 -ggdb -ffunction-sections -Wall -c -std=gnu99
LDFLAGS=-Wl,--start-group -lm  -Wl,--end-group -Wl,--gc-sections -mthumb -mcpu=Cortex-M0plus -Tsamd21g18a_flash.ld -L /usr/arm/CMSIS/Lib/GCC

SRCS=main.c system_samd21.c startup_samd21.c
OBJS=$(addprefix $(OUTPUT_FOLDER)/, $(SRCS:.c=.o))

# All target
all: $(OUTPUT_FILE).bin

# Link target
$(OUTPUT_FILE).elf: dir $(OBJS)
	$(CC) -o $(OUTPUT_FOLDER)/$(OUTPUT_FILE).elf $(LDFLAGS) $(OBJS)

$(OUTPUT_FILE).bin: $(OUTPUT_FILE).elf
	$(OBJCOPY) -O binary $(OUTPUT_FOLDER)/$(OUTPUT_FILE).elf $(OUTPUT_FOLDER)/$(OUTPUT_FILE).bin

# Compile target(s)
$(OUTPUT_FOLDER)/%.o: ./%.c
	$(CC) $(CFLAGS) $(INCLUDE_PATHS) -o $@ $<

dir:
	$(MKDIR) $(OUTPUT_FOLDER)

disasm: $(OUTPUT_FILE).elf
	$(OBJDUMP) -h -S $(OUTPUT_FOLDER)/$(OUTPUT_FILE).elf > $(OUTPUT_FOLDER)/$(OUTPUT_FILE).lss

size: $(OUTPUT_FILE).elf
	$(SIZE) $(OUTPUT_FOLDER)/$(OUTPUT_FILE).elf

install: $(OUTPUT_FILE).bin
	$(PROG) -e -w -v -R $(OUTPUT_FOLDER)/$(OUTPUT_FILE).bin

clean:
	rm -fR $(OUTPUT_FOLDER)
