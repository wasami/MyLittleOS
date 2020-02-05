#!/bin/sh
scriptdir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

# Make sure we have the c compiler we need
toolchain="arm-none-eabi-"

# Common CFLAGS
ccflags="-O0"
ccflags="${ccflags} -nostartfiles"
ccflags="${ccflags} -mfloat-abi=hard"
ccflags="${ccflags} -g"

# Whatever specific flags we use should also include the common c flags
cflags="${ccflags}"
cflags="${cflags} -mfpu=vfp"
cflags="${cflags} -march=armv6zk"
cflags="${cflags} -mtune=arm1176jzf-s"

#lflags="-Wl,-verbose"
lflags="-Wl,-T,rpi1.x"

kernel_elf="kernel.elf"
kernel_img="kernel.img"

printf "%s\n" "${toolchain}gcc ${cflags} ${scriptdir}/*.c ${scriptdir}/*.s -o ${kernel_elf}"
${toolchain}gcc ${cflags} ${lflags} ${scriptdir}/*.c ${scriptdir}/*.s -o ${kernel_elf}

if [ $? -ne 0 ]; then
    echo "ERROR: Failed to compile!" >&2
    exit 1
fi

printf "%s\n" "${toolchain}objcopy ${kernel_elf} -O binary ${kernel_img}"
${toolchain}objcopy ${kernel_elf} -O binary ${kernel_img}

mv kernel* build/