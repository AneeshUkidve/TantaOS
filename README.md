# TantaOS
Learning OSDev by making an OS from scratch,

# Dependencies
- Needs a cross compiler targeted for i686 to build the OS freestanding. We use 1686-elf-gcc and i686-elf-as to compile and assemble respectively. 
- grub
- xorriso

# Building the files
`make all` builds TantaOS.bin, this can be run in qemu by specifying the `-kernel` option.

`make TantaOS.iso` builds the iso file, this requires grub and xorriso installed.

`make clean` cleans the directory of all the build files, except isodir/boot/TantaOS.bin.
