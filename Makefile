# Will link statically with OpenCV, FFmpeg

CFLAGS = -O3 -D__STDC_CONSTANT_MACROS
LDFLAGS = -lopencv_imgproc -lopencv_core -lswscale -lavdevice -lavformat -lavcodec -lswresample -lavutil -llzma -lpthread -lbz2 -lz -lc -lrt
INSTALLED_DEPS = -Idependencies/include -Ldependencies/lib 
BIN = mpegflow

all:
	g++ main.cpp -o $(BIN) $(CFLAGS) $(LDFLAGS) $(INSTALLED_DEPS)
clean:
	rm $(BIN)
