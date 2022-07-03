#!/bin/bash

cd mo833-lammps; mkdir build || fail "Could not create the build directory"

#build instrumentation
cd mo833-lammps/utils; make || fail "Error when building time instrumentation" 

cd mo833-lammps/build; cmake ../cmake/ -DCMAKE_BUILD_TYPE=Release  -DPKG_KSPACE=on -DPKG_MANYBODY=on -DPKG_RIGID=on -DPKG_MISC=on -DPKG_MOLECULE=on -DBUILD_MPI=on -DPKG_GRANULAR=on -DMPI_C_COMPILER=mpicc -DMPI_CXX_COMPILER=mpic++ -DBUILD_OMP=on  || \
	fail "Error when configuring LAMMPS build directory" 
	
cd mo833-lammps/build; make -j 4 || \
