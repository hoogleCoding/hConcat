# makefile for the concat-program
HC = ghc
CFLAGS = -O3 -Wall 

all: concat

concat: 
	$(HC) $(CFLAGS) --make concat

clean:
	rm -rf dist
	rm -rf concat
	rm -rf *.o
	rm -rf *.hi
