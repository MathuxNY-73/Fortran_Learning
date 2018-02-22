FC=gfortran
FCFLAGS=-g -c -std=f95 -fdefault-real-8 -fbacktrace -fno-align-commons
FLFLAGS = -g -fbacktrace
EXEC=main.f95
SRC=$(wildcard *.f95)
OBJ=$(SRC:.f95=.o)

all: $(EXEC)

main: main.o
	@$(FC) -o $@ $^ $(FLFLAGS)

ex1: ex1.o
	@$(FC) -o $@ $^ $(FLFLAGS)

%.o : %.f95
	$(FC) -o $@ -c $< $(FCFLAGS)

%.mod: %.h
	$(FC) $(FLFLAGS) -o $@ $<

.PHONY: clean mrproper

clean:
	@rm -rf *.o

mrproper:
	@rm -rf $(EXEC)
