#!/bin/sh

scriptdir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

toolchain="arm-none-eabi-"

# Get the tutorial name from the script directory
tutorial=${scriptdir##*/}

for elf in ${scriptdir}/*.elf; do
    img=${elf%.elf}.img
    printf "%s\n" "Disassembling ${elf} to ${elf}.asm"
    ${toolchain}objdump -D ${elf} > ${elf}.asm
    ${toolchain}nm ${elf} > ${elf}.nm
done
