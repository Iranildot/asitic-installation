# ASITIC Installation Script
## Overview

This script automates the installation of the ASITIC software and its dependencies on Linux-based operating system. ASITIC (Analysis and Simulation of Spiral Inductors and Transformers for ICs) is a tool used for analyzing and designing inductors and transformers integrated circuits. The script ensures that the required files are downloaded, decompressed, and set up properly for use.

![Captura de tela de 2024-09-28 18-21-46](https://github.com/user-attachments/assets/e91a486a-7f1d-4391-967b-47d30b8a9c38)

## Features

- Checks if the user has superuser permissions before proceeding.
- Creates a dedicated workspace folder for ASITIC files.
- Downloads necessary executable files and technology files from specified URLs.
- Decompresses downloaded files to prepare them for use.
- Moves the technology file into the correct directory structure.
- Cleans up unnecessary files to maintain a tidy workspace.
- Installs the expect package, which is required for running the ASITIC tool.
- Creates an executable wrapper script that allows users to run ASITIC from anywhere in the terminal.

## Prerequisites

- A Linux-based operating system (Ubuntu, CentOS 7 or similar).
- Internet access to download the required files.
- Superuser permissions to install packages and create directories.

## Usage

1. Clone the Repository:
```bash
git clone https://github.com/Iranildot/asitic-installation.git
cd asitic-installation
```

2. Make the Script Executable:
  - chmod +x install-asitic-<target_distribution>.sh
```bash
chmod +x install-asitic-ubuntu.sh
```

3. Run the Script: Execute the script with superuser privileges:
  - sudo ./install-asitic-<target_distribution>.sh
```bash
sudo ./install-asitic-ubuntu.sh
```

4. Run ASITIC, after installation:
  - In this step, you must run the following code inside ASITIC folder.
  - asitic_linux -t ./common<technology_name>.tek
  - Replace <technology_name>.tek with the actual technology file you want to use (e.g., sky130.tek).
```bash
cd ASITIC
```
```bash
asitic_linux -t ./common/tek/sky130.tek
```

## Suported technologies

- BiCMOS.tek
- CMOS.tek
- sky130.tek

## Code Explanation

- **Superuser Check:** The script first checks if the user is running it as a superuser. If not, it displays an error message and exits.

- **Workspace Creation:** It creates a directory named ASITIC in the home directory and navigates into it.

- **File Downloads:** The script downloads the following files:
  - **asitic_linux.gz:** The main executable for ASITIC.
  - **doc_05_28_01.tgz:** Documentation and additional files.
  - **common.tgz:** Common resources required for ASITIC.
  - **sky130.tek:** An example technology file.

- **Decompression:** The script decompresses the downloaded .gz and .tgz files.
- **File Management:** It moves the technology file to the appropriate directory and cleans up by deleting the original compressed files.
- **Permission Management:** The script sets executable permissions on the asitic_linux file and creates an expect wrapper script that handles user inputs.
- **PATH Update:** The final step adds the asitic executable to the system PATH, allowing it to be run from anywhere in the terminal.

## Cleanup

After installation, the workspace is cleaned, and unnecessary files are deleted to keep the system tidy.

## ASITIC example (using sky130.tek)

On the ASITIC terminal, run **optsq** to make a square inductor, and then provide the other information as follows.

```
ASITIC>  optsq

Desired inductance and accuracy in percent (e.g. '2 5' for 2nH within 5%)? (nH) 1 1 

Name? 10

Length? 120

Min/Step/Max Spacing? 2 1 10

Min/Step/Max Width? 2 1 25

Metal layer? met5

Exit metal layer? met4

Frequency? (GHz) 2.5
```

![Captura de tela de 2024-09-28 18-21-21](https://github.com/user-attachments/assets/e1d78ab0-09f4-42d6-89b4-16c8bd52ea54)

## Contribution

Contributions are welcome! Feel free to submit issues or pull requests if you have improvements or fixes.

## License

This project is licensed under the Apache License.

## Notes

Feel free to modify the sections according to your needs or to add any specific details relevant to your project. This description provides a comprehensive overview of the script's functionality and usage, making it easy for users to understand its purpose and how to use it effectively. If you have any additional requirements or need further adjustments, let me know!
