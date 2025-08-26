CFLAGS = -march=native -O3
LDLIBS = -lX11 -ltiff -lpng -lfftw3f -ljpeg -lm

all : vnav fancy_downsa tiffu

OBJ = iio.o ftr.o fancy_image.o tiff_octaves_rw.o
BIN = vnav fancy_downsa tiffu

vnav : vnav.c $(OBJ)
tiffu : tiffu.c $(OBJ)
fancy_downsa : fancy_downsa.c $(OBJ)

clean  : ; $(RM) $(BIN) $(OBJ) $(SYNTH)




# generated synthetic data
SYNTH = o/x.tif o/x_fm.tif o/x_am.tif o/x_amfm.tif

tests: $(SYNTH)

C = zero:360x6000 # base canvas

# basic sinusoidal wave
o/x.tif:; plambda $C ":j  sin 107 * 127 +" -o $@

# basic sinusoidal wave, frequency modulated, non-periodic
o/x_fm.tif:; plambda $C ":j 1.618 / cos :j +  sin 107 * 127 +" -o $@

# basic sinusoidal wave, amplitude modulated, non-periodic
o/x_am.tif:; plambda $C ":j 1.618 / cos 1 + 2 / :j  sin * 107 * 127 +" -o $@

# basic sinusoidal wave, amplitude and frequency modulated
o/x_amfm.tif:; plambda $C ":j 10 / >1 <1 sin  <1 6.28 * + cos 1 + 2 /   1 <1 +  <1 pi * cos + sin *   107 * 127 +" -o $@
