BINARY=final
CODEDIRS=. lib external
INCDIRS=. ./include ./external

CC=gcc
OPT=-O1
DEPFLAGS=-MP -MD
CFLAGS=$(foreach D, $(INCDIRS),-I$(D)) $(DEPFLAGS) $(OPT)

CFILES=$(foreach D, $(CODEDIRS),$(wildcard $(D)/*.c))

# Pattern Substitution  
OBJECTS=$(patsubst %.c,%.o,$(CFILES)) 
DEPFILES=$(patsubst %.c,%.d,$(CFILES))

# Build all binaries
all: $(BINARY)

$(BINARY): $(OBJECTS)
	@echo "Linking and producing the final application..."
	$(CC) $(CFLAGS) -o $@ $^

# regular expression where %x is a wildcard
# Build all Object files
%.o: %.c 
	@echo "Compiling the c files to o files..."
	$(CC) $(CFLAGS) -c -o $@ $<

# Delete build output
clean:
	@echo "Removing binaries, objects, deps and tgz files..."
	@rm -rf $(BINARY) $(OBJECTS) $(DEPFILES) dist.tgz

# shell commands are a set of keystrokes away
distribute: clean
	tar zcvf dist.tgz *

-include $(DEPFILES)