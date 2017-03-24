# visualize motion vectors
mkdir -p vis_dump
../mpegflow mpi_sintel_final_alley_1.avi | ../vis mpi_sintel_final_alley_1.avi vis_dump

# visualize motion vectors and occupancy info
mkdir -p vis_dump
../mpegflow --occupancy mpi_sintel_final_alley_1.avi | ../vis --occupancy mpi_sintel_final_alley.avi vis_dump
