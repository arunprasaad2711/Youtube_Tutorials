#
# This is the Makefile for the model
#

# Program Name
PROG = SWE.exe

# Source Folder name
VPATH=src
# Object Folder
OBJDIR=objs
# Module Folder
MODDIR=mods
# Executable Folder
EXECDIR=exec

# Compiler and Flags
FC = /usr/bin/gfortran
FFLAGS = -c -O3 -mcmodel=medium -g -I/usr/include
FLINK = -O3 -mcmodel=medium -g -L/usr/lib -lnetcdff
LINKER = $(FC) -o

# Object files
OBJS = initializer.o swe_rk4.o main.o saver.o parameters.o

model: $(PROG)

# Creates the model
$(PROG): $(OBJS)
	@echo "--------------------------------------"
	@echo "Creating the executable for the model"
	@echo "--------------------------------------"
	$(LINKER) $(PROG) $(OBJS) $(FLINK)
	mv *.o $(OBJDIR)
	mv *.mod $(MODDIR)
	mv *.exe $(EXECDIR)

%.o: %.f95
	@echo "--------------------------------------"
	@echo "Compiling the file $<"
	@echo "--------------------------------------"
	$(FC) $(FFLAGS) $<
	
# Cleans up everything
clean:
	@echo "--------------------------------------"
	@echo "Cleaning everything up in model"
	@echo "--------------------------------------"
	rm -f *~ *.nc plot*.png *.exe *.o *.mod
	rm -f $(OBJDIR)/*.o $(OBJDIR)/*~
	rm -f $(MODDIR)/*.mod $(MODDIR)/*~
	rm -f $(EXECDIR)/*~ $(EXECDIR)/*.exe $(EXECDIR)/*.nc
	rm -f $(VPATH)/*~

initializer.o		:  initializer.f95 parameters.o
swe_rk4.o	        :  swe_rk4.f95 parameters.o
saver.o		        :  saver.f95 parameters.o
main.o		        :  main.f95 parameters.o
parameters.o        :  parameters.f95
