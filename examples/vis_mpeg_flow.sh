# visualize motion vectors
../mpegflow mpi_sintel_final_alley_1.avi | ../vis mpi_sintel_final_alley_1.avi

# dump the visualization
mkdir -p vis_dump
../mpegflow mpi_sintel_final_alley_1.avi | ../vis --dump vis_dump mpi_sintel_final_alley_1.avi

# visualize motion vectors and occupancy info
../mpegflow --occupancy mpi_sintel_final_alley_1.avi | ../vis --occupancy mpi_sintel_final_alley.avi
