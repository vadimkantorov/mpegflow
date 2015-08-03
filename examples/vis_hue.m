% The script requires the training sequences of the MPI Sintel dataset (http://sintel.is.tue.mpg.de/).
% flowToColor and computeColor are originally part of the MPI Sintel's bundler.
% The script has originally been used to produce visualizations for https://github.com/vadimkantorov/mpegflow/blob/master/README.md, but you could use it on other videos by adjusting VIDEO_PATH

VIDEO_PATH = 'mpi_sintel_final_alley_1.avi';

% system(sprintf('ffmpeg -i training/final/alley_1/frame_%%04d.png -q:v 1.0 %s', VIDEO_PATH));

system(sprintf('../mpegflow "%s" > vis_hue_flow.txt', VIDEO_PATH));
system('mkdir -p vis_hue_dump');

f = fopen('vis_hue_flow.txt', 'r');
while true
    frameIndex_rows_cols = fscanf(f, '# pts=%*d frame_index=%d pict_type=%*c output_type=%*s shape=%dx%d origin=%*s\n');
    if isempty(frameIndex_rows_cols)
        break
    end

    dxdy = fscanf(f, '%d ', fliplr(frameIndex_rows_cols(2:end)'))';
    flow = cat(3, dxdy(1:size(dxdy, 1) / 2, :), dxdy(size(dxdy, 1) / 2 + 1 : end, :));
    img = flowToColor(flow);
    imwrite(img, sprintf('vis_hue_dump/%06d.png', frameIndex_rows_cols(1)));
end
fclose(f);
