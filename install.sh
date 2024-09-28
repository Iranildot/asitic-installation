#!/bin/bash

# CHECKING IF USER IS SUPERUSER
if [ "$(id -u)" -ne 0 ]; then
  echo "You need superuser permitions to run this file"
  exit 1
fi

cd /home/

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

# INSTALLING EXPECT
echo "  Installing expect"
sudo apt -y update -qq
sudo apt -y install expect -qq

# CREATING asitic EXECUTABLE FILE TO EXECUTE ASITIC FROM ANYWHERE
echo "  Creating asitic executable file"
echo -e "#!/usr/bin/expect -f\n\n\
# CHECKS IF AN ARGUMENT WAS PASSED\n\
if {[llength \$argv] != 1} {\n\
    puts \"Usage: asitic <technology_name>.tek\"\n\
    exit 1\n\
}\n\
\n\
# CAPTURES THE NAME OF THE TECHNOLOGY FILE PASSED AS AN ARGUMENT\n\
set tecnologia [lindex \$argv 0]\n\
\n\
# EXECUTES THE ASITIC\n\
spawn /home/ASITIC/asitic_linux\n\
\n\
# AWAITS THE MESSAGE \"TECHNOLOGY FILE NAME?\"\n\
expect \"Technology File Name?\"\n\
\n\
# SENDS THE NAME OF THE TECHNOLOGY FILE TO THE ASITIC\n\
send \"/home/ASITIC/common/tek/\$tecnologia\r\"\n\
\n\
# ALLOWS INTERACTION WITH THE ASITIC AFTER SENDING THE FILE\n\
interact" > asitic

# GIVING PERMISSION FOR THE asitic FILE TO BE EXECUTED
echo "  Giving permition to asitic file to be executed"
chmod +x asitic

sudo chmod -R 775 /home/ASITIC

echo "  Adding asitic to PATH"
mv ./asitic /usr/bin/

echo "Instalation done"
