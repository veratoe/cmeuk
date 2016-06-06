$(f).o: wub.asm
	nasm -f elf64 -g -F dwarf $(f).asm
	$(LD) -o $(f)x -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc $(f).o


