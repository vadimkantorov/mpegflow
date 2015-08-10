# extract motion vectors
../mpegflow mpi_sintel_final_alley_1.avi > alley_1.txt

# extract motion vectors and occupancy info
../mpegflow --occupancy mpi_sintel_final_alley_1.avi > alley_1_occupancy.txt

# extract motion vectors in raw format
../mpegflow --raw mpi_sintel_final_alley_1.avi > alley_1_raw.txt

# extract motion vectors with enforced 8x8 grid
../mpegflow --grid8x8 mpi_sintel_final_alley_1.avi > alley_1_grid8x8.txt
