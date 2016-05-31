wub.o: wub.asm
	nasm -f elf64 -g -F dwarf wub.asm
	$(LD) -g wub.o -o wubx


