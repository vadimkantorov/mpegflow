rm -rf opencv-2.4.11.tar.gz opencv-2.4.11

export MAKEFLAGS=-j16

wget https://github.com/Itseez/opencv/archive/2.4.11.tar.gz -O opencv-2.4.11.tar.gz
tar -xf opencv-2.4.11.tar.gz
cd opencv-2.4.11
rm -rf build
mkdir build && cd build

# for custom ffmpeg discovery
export LD_LIBRARY_PATH=$(pwd)/../../lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$(pwd)/../../lib/pkgconfig

cmake -D CMAKE_INSTALL_PREFIX="$(pwd)/../.." -D CMAKE_BUILD_TYPE=RELEASE -D BUILD_SHARED_LIBS=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D BUILD_opencv_gpu=OFF -D BUILD_opencv_python=OFF -D BUILD_opencv_java=OFF -D BUILD_opencv_ml=OFF -D BUILD_opencv_contrib=OFF -D BUILD_opencv_ocl=OFF -D BUILD_opencv_legacy=OFF -D BUILD_opencv_nonfree=OFF -D BUILD_opencv_photo=OFF -D BUILD_opencv_video=OFF -D BUILD_opencv_stitching=OFF -D BUILD_opencv_superres=OFF -D BUILD_opencv_photo=OFF -D BUILD_opencv_objdetect=OFF -D BUILD_opencv_features2d=OFF -D BUILD_opencv_calib3d=OFF -D BUILD_opencv_flann=OFF -D BUILD_opencv_imgproc=ON -D WITH_CUDA=OFF -D WITH_JASPER=OFF -D WITH_TIFF=OFF -D WITH_JPEG=OFF -D WITH_OPENEXR=OFF -D BUILD_PNG=ON -D BUILD_opencv_highgui=ON ..
make && make install
cp "$(pwd)/3rdparty/lib/liblibpng.a" "$(pwd)/../../lib/libpng.a"
