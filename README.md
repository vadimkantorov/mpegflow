### mpegflow

The tool accepts a video file path as command-line argument and writes MPEG-flow (motion vectors) to standard output. By default, the tool outputs the motion vectors arranged in two matrices - dx and dy.
##### Command-line options:

Option | Description
--- | ---
--help or -h | will output the usage info
--raw | will prevent motion vectors from being arranged in matrices
--forcegrid8 | will force fine 8x8 grid
--forcegrid16 | will force coarse 16x16 grid
--occupancy | will append occupancy matrix after motion vector matrices
--quiet | will suppress debug output

### vis
The tool accepts a video file path as command-line argument, output of *mpegflow* on standard input and displays (or dumps) visualization of motion vectors overlayed on video frames.
##### Command-line options:

Option | Description
--- | ---
--help or -h | will output the usage info
--dump dumpDir | will skip showing visualization on screen and will save the images to dumpDir instead
--occupancy | will expect occupancy information from *mpegflow* and will visualize it as well

### License
All code and scripts are licensed under the [MIT license](http://github.com/vadimkantorov/mpegflow/blob/master/LICENSE).
