#!/bin/bash

# CHECKING IF USER IS SUPERUSER
if [ "$(id -u)" -ne 0 ]; then
  echo "You need superuser permitions to run this file"
  exit 1
fi

# CREATING A WORKSPACE FOLDER
echo "Creating ASITIC folder"
mkdir ASITIC

# GOING INSIDE ASITIC FOLDER
cd ASITIC

# INSTALLING ASITIC EXECUTABLE FILE AND THE TECNOLOGIES
echo "Installing asitic needed files"
echo "  asitic_linux.gz"
wget -q https://web.archive.org/web/20210509075224/http://rfic.eecs.berkeley.edu/~niknejad/Asitic/grackle/asitic_linux.gz
echo "  doc_05_28_01.tgz"
wget -q https://web.archive.org/web/20210509075224/http://rfic.eecs.berkeley.edu/~niknejad/Asitic/grackle/doc_05_28_01.tgz
echo "  common.tgz"
wget -q https://web.archive.org/web/20210509075224/http://rfic.eecs.berkeley.edu/~niknejad/Asitic/3.19.00/common.tgz
echo "  sky130.tek"
wget -q https://raw.githubusercontent.com/yrrapt/inductor-generator/main/asitic/sky130.tek

# DECOMPRESSING FILES
echo "Decompressing files"
echo "  asitic_linux.gz"
gunzip -q asitic_linux.gz
echo "  doc_05_28_01.tgz"
tar -xzf doc_05_28_01.tgz
echo "  common.tgz"
tar -xzf common.tgz

# PUTTUNG sky130.tek FILE INTO TEK FOLDER
mv ./sky130.tek ./common/tek/

# CLEANING WORKSPACE
echo "Cleaning workspace"
echo "  Deleting doc_05_28_01.tgz"
rm -f doc_05_28_01.tgz
echo "  Deleting common.tgz"
rm -f common.tgz

echo "Prepering environment"

# GIVING PERMISSION FOR THE asitic_linux FILE TO BE EXECUTED
echo "  Giving permition to asitic_linux file to be executed"
chmod +x asitic_linux

chmod -R 777 .

echo "  Adding asitic_linux to PATH"
mv ./asitic_linux /usr/bin/

echo "Instalation done"
