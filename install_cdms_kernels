#!/bin/bash

# Install CDMS Kernels

# Goes through all the releases of the CDMS software currently
# available through CVMFS (assumed to be already mounted on /cvmfs)
# and installs the kernels.

# Old releases that do not support this throw a harmless error

# Running this multiple times just overwrites previous entries
# does not create duplicates

setup_script=/cvmfs/cdms.opensciencegrid.org/setup_cdms.sh

# discard deprecated and nightly releases
releases=$(bash $setup_script -L | grep "^V" | grep -v "DEPRECATED")

for rel in $releases
do
    # install kernel (-K) in the user home folder (--user)
    bash $setup_script -K $rel --user
done
