# command to make elf file from c code
arm-none-eabi-gcc -O2 -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -nostartfiles armc-2.c -o kernel.elf

#then extract image from elf file
arm-none-eabi-objcopy kernel.elf -O binary kernel.img