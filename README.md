# Makefile-template
This is a basic Makefile template (not generate HEX or ELF file)

This Makefile operation:

make build:

	Compile the main.c and other libs.c files (in src dir)into a main.o file and other libs.o files (in build dir)
 
	It also include the header files (in include dir)
 
	Then link .o files into the main exe file in (build dir)
 
make run:

	Run the main exe file in (build dir)
 
make clean:

	Delete all .o files and main exe file (build dir)
