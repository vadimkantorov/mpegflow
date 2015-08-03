# visualize motion vectors
../mpegflow mpi_sintel_final_alley_1.avi | ../vis mpi_sintel_final_alley_1.avi

# visualize motion vectors and occupancy info
../mpegflow --occupancy mpi_sintel_final_alley_1.avi | ../vis --occupancy mpi_sintel_final_alley.avi
