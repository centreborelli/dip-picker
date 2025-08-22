CFLAGS = -march=native -O3
LDLIBS = -lX11 -ltiff -lpng -lfftw3f -ljpeg -lm

all : vnav fancy_downsa tiffu

OBJ = iio.o ftr.o fancy_image.o tiff_octaves_rw.o
BIN = vnav fancy_downsa tiffu

vnav : vnav.c $(OBJ)
tiffu : tiffu.c $(OBJ)
fancy_downsa : fancy_downsa.c $(OBJ)


clean  : ; $(RM) $(BIN) $(OBJ)
