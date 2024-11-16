GCC=gcc
CFLAGS=-c -I.

programa: main.o
	$(GCC) -o programa main.o -lm

main.o: main.c
	$(GCC) $(CFLAGS) main.c

.PHONY: clean
clean:
	rm -f *.o
