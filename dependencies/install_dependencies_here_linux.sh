# This script will try to download and install from sources opencv 2.4.9 (with minimal set of modules), ffmpeg 2.4, yasm 1.3.0 (required by ffmpeg).
# I cannot guarantee it will work on absolutely all systems, hopefully it still provides guidance.

rm -rf *.gz *.bz2 *.zip yasm-1.3.0 ffmpeg-2.4 opencv-2.4.9

wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar -xf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure --prefix=$(pwd)/..
make -j4 && make install
cd ..

wget http://ffmpeg.org/releases/ffmpeg-2.4.tar.bz2
tar -xf ffmpeg-2.4.tar.bz2
cd ffmpeg-2.4
./configure --prefix=$(pwd)/.. --yasmexe=$(pwd)/../bin/yasm
make -j4 && make install
cd ..

wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.9/opencv-2.4.9.zip
unzip opencv-2.4.9.zip
cd opencv-2.4.9
mkdir build && cd build
cmake -D CMAKE_INSTALL_PREFIX=$(pwd)/../.. -D CMAKE_BUILD_TYPE=RELEASE -D BUILD_SHARED_LIBS=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D BUILD_opencv_gpu=OFF -D BUILD_opencv_python=OFF -D BUILD_opencv_java=OFF -D BUILD_opencv_ml=OFF -D BUILD_opencv_contrib=OFF -D BUILD_opencv_ocl=OFF -D BUILD_opencv_legacy=OFF -D BUILD_opencv_nonfree=OFF -D BUILD_opencv_photo=OFF -D BUILD_opencv_video=OFF -D BUILD_opencv_stitching=OFF -D BUILD_opencv_superres=OFF -D BUILD_opencv_photo=OFF -D BUILD_opencv_objdetect=OFF -D BUILD_opencv_features2d=OFF -D BUILD_opencv_calib3d=OFF -D WITH_CUDA=OFF ..
make -j4 && make install
cd ../..
