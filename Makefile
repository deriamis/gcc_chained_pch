CC = gcc
CFLAGS =
DEPS = include_1.h include_2.h include_3.h
OBJ = chained_pch_test.o

ifdef CHAINED_PCH
chained_pch: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
%.o: %.c include_3.gch
	$(CC) -c -o $@ $< $(CFLAGS)
include_3.gch: include_3.h include_2.gch include_1.gch
	$(CC) -fpch-preprocess -c -o $@ $< $(CFLAGS)
include_2.gch: $@ include_2.h include_1.gch
	$(CC) -fpch-preprocess -c -o $@ $< $(CFLAGS)
include_1.gch: include_1.h
	$(CC) -c -o $@ $< $(CFLAGS)
else
no_pch: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)
endif

.PHONY: clean

clean:
	rm -f no_pch chained_pch $(OBJ) *.gch *~ core
