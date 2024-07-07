#This Makefile operation:
#make build:
	#Compile the main.c and other libs.c files (in src dir)into a main.o file and other libs.o files (in build dir)
	#It also include the header files (in include dir)
	#Then link .o files into the main exe file in (build dir)
#make run:
	#Run the main exe file in (build dir)
#make clean:
	#Delete all .o files and main exe file (build dir)

#CC: Program for compiling C programs, default cc
#CXX: Program for compiling C++ programs, default g++
#CFLAGS: Extra flags to give to the C compiler
#CXXFLAGS: Extra flags to give to the C++ compiler
#CPPFLAGS: Extra flags to give to the C preprocessor
#LDFLAGS: Extra flags to give to the linker

EXE_NAME = main
SRC_DIR = src
HEADER_DIR = include
BUILD_DIR = build

C = gcc
C_STANDARD = c17
C_WARNINGS = -Wall -Wextra -Wpedantic
#gcc -Wall Wextra -Wpedantic -std=c17 -g(opt) -O0
C_OPTIMIZATION0 = -O0
CFLAGS = $(C_WARNINGS) -std=$(C_STANDARD) $(C_OPTIMIZATION0)
CPPFLAGS = -I $(HEADER_DIR)
LDFLAGS = 
#C_OBJFILES = main.o my_lib.o
C_SOURCES = $(wildcard src/*.c)
#patsubst = $(text:pattern=replacement)
C_OBJFILES = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(C_SOURCES))
COMPILER_CALL = $(C) $(CFLAGS) $(CPPFLAGS)
create:
	@mkdir $(BUILD_DIR)

build: create $(C_OBJFILES)
	$(COMPILER_CALL) $(C_OBJFILES) $(LDFLAGS) -o $(BUILD_DIR)/$(EXE_NAME)
run:
	./$(BUILD_DIR)/$(EXE_NAME)
clean:
	rm $(BUILD_DIR)/*.o
	rm $(BUILD_DIR)/$(EXE_NAME)
	rm -r $(BUILD_DIR)

#PATTERNS#
# $@: the file name of the target
# $<: the name of the first ependency
# $^: the names of all prerequisites
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c #For every .c file in dir generate a .o file with same name
	$(COMPILER_CALL) -c $< -o $@
#
