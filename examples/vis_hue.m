addpath('flow_code/MATLAB');

seqName = 'alley_1';

%system(sprintf('ffmpeg -i training/final/%s/frame_%04d.png -q:v 1.0 mpi_sintel_final_%s.avi', seqName, seqName));
system(sprintf('./mpegflow mpi_sintel_final_%s.avi > flow_%s.txt', seqName, seqName));
system(sprintf('mkdir -p %s_vis', seqName));

f = fopen(sprintf('flow_%s.txt', seqName), 'r');
while true
    frameIndex_rows_cols = fscanf(f, '# pts=%*d frame_index=%d pict_type=%*c output_type=%*s shape=%dx%d origin=%*s\n');
    if isempty(frameIndex_rows_cols)
        break
    end
        
    dxdy = fscanf(f, '%d ', fliplr(frameIndex_rows_cols(2:end)'))';
    flow = cat(3, dxdy(1:size(dxdy, 1) / 2, :), dxdy(size(dxdy, 1) / 2 + 1 : end, :));
    img = flowToColor(flow);
    imwrite(img, sprintf('%s_vis/%06d.png', seqName, frameIndex_rows_cols(1)));
end
fclose(f);