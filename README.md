# Information & Contact

We release **mpegflow** for easy extraction of MPEG-flow (motion vectors) from video files along with a visualization tool **vis**, both under the [MIT license](http://github.com/vadimkantorov/mpegflow/blob/master/LICENSE). We provide Makefiles for Linux / Windows and distribute [binary releases](http://github.com/vadimkantorov/mpegflow/releases).

Please submit bugs on [GitHub](http://github.com/vadimkantorov/mpeflow/issues) directly. For any other question, please contact Vadim Kantorov at vadim.kantorov@inria.fr or vadim.kantorov@gmail.com.

If you use this code, please cite our work:

> @inproceedings{kantorov2014,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;author = {Kantorov, V. and Laptev, I.},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;title = {Efficient feature extraction, encoding and classification for action recognition},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;booktitle = {Proc. Computer Vision and Pattern Recognition (CVPR), IEEE, 2014},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;year = {2014}
}

Source | 3 | 15 | 50
--- | --- | --- | ---
mpegflow | ![](https://raw.githubusercontent.com/vadimkantorov/mpegflow/master/examples/mpi_sintel_final_alley_1_vis_hue_examples/000003.png) | ![](https://raw.githubusercontent.com/vadimkantorov/mpegflow/master/examples/mpi_sintel_final_alley_1_vis_hue_examples/000015.png) | ![](https://raw.githubusercontent.com/vadimkantorov/mpegflow/master/examples/mpi_sintel_final_alley_1_vis_hue_examples/000050.png)
Ground truth | ![](https://raw.githubusercontent.com/vadimkantorov/mpegflow/master/examples/mpi_sintel_final_alley_1_vis_hue_examples/gt_frame_0002.png) | ![](https://raw.githubusercontent.com/vadimkantorov/mpegflow/master/examples/mpi_sintel_final_alley_1_vis_hue_examples/gt_frame_0014.png) | ![](https://raw.githubusercontent.com/vadimkantorov/mpegflow/master/examples/mpi_sintel_final_alley_1_vis_hue_examples/gt_frame_0049.png)

# mpegflow
The tool accepts a video file path as command-line argument and writes MPEG-flow (motion vectors) to standard output. By default, the tool outputs the motion vectors arranged in two matrices - dx and dy.

##### Command-line options:

Option | Description
--- | ---
--help or -h | will output the usage info
--raw | will prevent motion vectors from being arranged in matrices
--forcegrid8x8 | will force fine 8x8 grid
--forcegrid16x16 | will force coarse 16x16 grid
--occupancy | will append occupancy matrix after motion vector matrices
--quiet | will suppress debug output

# vis
The tool accepts a video file path as command-line argument, output of **mpegflow** on standard input and displays (or dumps) visualization of motion vectors overlayed on video frames.

##### Command-line options:

Option | Description
--- | ---
--help or -h | will output the usage info
--dump dumpDir | will skip showing visualization on screen and will save the images to dumpDir instead
--occupancy | will expect occupancy information from **mpegflow** and will visualize it as well

# Examples
- Extract motion vectors:
    > $ ./mpegflow video.avi > flow.txt

- Visualize motion vectors:
    > $ ./mpegflow video.avi | ./vis video.avi

- Save visualization to disk:
    > $ mkdir -p vis_dump && ./mpegflow video.avi | ./vis --dump vis_dump video.avi

Runnable examples are in ```examples/extract_motion_vectors.sh``` and ```examples/vis_motion_vectors.sh```. Feel free to use ```vis.cpp``` and ```examples/vis_hue.m``` as examples of parsing **mpegflow** output. ```examples/vis_hue``` can also be used to produce hue flow visualizations like above.

# Building from source
**mpegflow** depends only on a recent FFmpeg, **vis** depends on FFmpeg, OpenCV and libpng. The tools are known to work with FFmpeg 2.7.2 and OpenCV 2.4.11. We strongly recommend using ```dependencies/install_ffmpeg_here_linux.sh``` and ```dependencies/install_opencv_here_linux.sh```, even if you already have the dependencies installed elsewhere. Once the dependencies are visible to g++, run ```make``` to build **mpegflow** and ```make vis``` to build **vis**.

To build the tools on Windows:

1. Follow ```dependencies/install_dependencies_here_windows.txt```
2. Fix OPENCV_DIR, FFMPEG_DIR, VC_VERSION, OPENCV_ARCH in Makefile.nmake if needed
3. Run from Visual Studio Developer Command Prompt (VS2013 x64 Native Tools Command Prompt from VS2013 Community Edition worked for us):

 > $ nmake -f Makefile.nmake
