CFLAGS = -O3 -D__STDC_CONSTANT_MACROS
LDFLAGS = -lswscale -lavdevice -lavformat -lavcodec -lswresample -lavutil -lpthread -lbz2 -lz -lzma -lc -lrt
INSTALLED_DEPS = -Idependencies/include -Ldependencies/lib
BIN_MPEGFLOW = mpegflow
BIN_VIS = vis

$(BIN_MPEGFLOW): mpegflow.cpp
	g++ mpegflow.cpp -o $(BIN_MPEGFLOW) $(CFLAGS) $(LDFLAGS) $(INSTALLED_DEPS)

$(BIN_VIS): vis.cpp
	g++ vis.cpp -o $(BIN_VIS) $(CFLAGS) -lopencv_highgui -lopencv_imgproc -lopencv_core -lpng $(LDFLAGS) $(INSTALLED_DEPS)

clean:
	rm $(BIN_MPEGFLOW) $(BIN_VIS)

.PHONY: $(BIN_MPEGFLOW) $(BIN_VIS)
