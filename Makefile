.PHONY: clean

PREFIX = ~/Coding/cross/bin
GCC = $(PREFIX)/i686-elf-gcc
AS = $(PREFIX)/i686-elf-as


all: TantaOS.bin

TantaOS.iso: TantaOS.bin src/grub.cfg
	@cp src/grub.cfg isodir/boot/grub/grub.cfg
	@cp TantaOS.bin isodir/boot/TantaOS.bin
	@grub-mkrescue -o TantaOS.iso isodir
	@echo "ISO file created successfully"

TantaOS.bin: kernel.o boot.o src/linker.ld
	@$(GCC) -T src/linker.ld -o TantaOS.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
	@echo "Created TantaOS.bin"

kernel.o: src/kernel.c
	@$(GCC) -c src/kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
	@echo "Compiled kernel.c"

boot.o: src/boot.s
	@$(AS) src/boot.s -o boot.o
	@echo "Assembled boot.s"

clean:
	@rm *.o
	@rm *.iso
	@rm *.bin

