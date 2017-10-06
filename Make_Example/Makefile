# This is the Makefile for creating stats.exe

# This is the fortran compiler
FC = gfortran
# This variable will give the compiler flags
FCFLAGS = -c
# This variable will give the linker flags
LINKER = $(FC) -o
# This variable will give the link flags
FCLINKS = -g

# $< will point the first file in the dependency chain
# $@ will point the last file in the dependency chain

# This variable stores the object files
OBJS = stats.o stat_funcs.o

# Program name variable
PROG = stats.exe

# Make all target
all: $(PROG)

# This line produces the executable
$(PROG): $(OBJS)
	@echo "---------------------------------------"
	@echo "Creating the executable for the Program"
	@echo "---------------------------------------"
	$(LINKER) $(PROG) $(OBJS) $(FCLINKS)

%.o : %.f95
	@echo "--------------------------------------"
	@echo "Compiling the file $<" 
	@echo "--------------------------------------"
	$(FC) $(FCFLAGS) $<

# This line is for clean-up
clean:
	rm -rf *.exe *.o *~ *.mod

# Dependency chains
stats.o      : stats.f95 stat_funcs.o
stat_funcs.o : stat_funcs.f95