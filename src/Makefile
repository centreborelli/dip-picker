CFLAGS = -march=native -O3
LDLIBS = -lX11 -ltiff -lpng -lfftw3f -ljpeg -lm

BIN = vnav
OBJ = iio.o ftr.o

$(BIN) : $(OBJ)

clean  : ; $(RM) $(BIN) $(OBJ)
