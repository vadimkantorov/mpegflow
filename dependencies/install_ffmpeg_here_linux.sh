rm -rf yasm-1.3.0.tar.gz ffmpeg-2.7.2.tar.gz ffmpeg-2.7.2 yasm-1.3.0

export MAKEFLAGS=-j16

wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar -xf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure --prefix="$(pwd)/.."
make && make install
cd ..

wget http://ffmpeg.org/releases/ffmpeg-2.7.2.tar.gz
tar -xf ffmpeg-2.7.2.tar.gz
cd ffmpeg-2.7.2
./configure --prefix="$(pwd)/.." --yasmexe="$(pwd)/../bin/yasm" --disable-vaapi
make && make install
