#!/bin/bash

source "${BASH_SOURCE%/*}/check_deps.sh"

# Function moves content of subdirectories to provided directory
# 1) Current folder.
function merge_folders_inside() {
    # Check args
    if [[ $# != 1 ]]; then
        echo "Expected one argument, directory path"
        return 1
    fi

    # Move contents of directories to parent directory and remove them
    # only if there is one directory.
    local folders=($(ls -d $1/*/))

    if [[ ${#folders[@]} != 1 ]]; then
        echo "Skipping folder merging..."
        return 0
    fi

    for folder in ${folders[@]}; do
        echo "Moving contents of $1/$folder to $1..."
        mv "$folder"* "$1" || {
            echo "Failed to move subdirectory content"
            return 1
        }
        rmdir "$folder" || {
            echo "Failed to remove empty? folder"
            return 1
        }
    done
}

# Download ARM GCC toolchain.
# 1) Directory where toolchain should be put.
function download_gcc_toolchain() {
    # Expect one argument
    if [[ $# != 1 ]]; then
        echo "Expected one argument, directory where to place toolchain."
        return 1
    fi

    # Select binary based on the OS type.
    case $OSTYPE in
        darwin*) {
            echo "Downloading ARM GCC for Mac OS..."
            local arm_gcc_url="https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-mac.tar.bz2"
            local arm_gcc_outfile="$1.tar.bz2"
        };;
        linux-gnu) {
            echo "Downloading ARM GCC for Linux..."
            local arm_gcc_url="https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2"
            local arm_gcc_outfile="$1.tar.bz2"
        };;
        cygwin) {
            echo "Downloading ARM GCC for Windows (Cygwin)..."
            local arm_gcc_url="https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-win32.zip"
            local arm_gcc_outfile="$1.zip"
        };;
        *) {
            echo "'$OSTYPE' OS is not supported."
            return 1
        };;
    esac

    # Prepare directory
    mkdir -p "$1"

    # Download toolchain
    curl "$arm_gcc_url" > "$arm_gcc_outfile" || {
        echo "Failed to download GCC toolchain"
        return 1
    }

    # Unzip toolchain
    echo "Extracting GCC toolchain..."

    # Use appropriate tool depending on the type of the archive
    local arm_gcc_archive_filename=$(basename $arm_gcc_outfile)
    local arm_gcc_archive_type="${arm_gcc_archive_filename#*.}" 
    case $arm_gcc_archive_type in
        tar.bz2) tar -xf "$arm_gcc_outfile" -C "$1";;
        zip) unzip -q "$arm_gcc_outfile" "-d$1";;
        *) {
            echo "Unsupported toolchain archive type '$arm_gcc_archive_type'"
            return 1
        };;
    esac

    if [[ $? -ne 0 ]]; then
        echo "Failed to extract GCC toolchain"
        return 1
    fi

    # Merge folders
    merge_folders_inside "$1" || {
        echo "Failed to merge folder $1"
        return 1
    }

    # Remove file
    rm "$arm_gcc_outfile"
}

# Download nRF tools.
# 1) Directory where tools should be put.
function download_nrf_tools() {
    # Expect one argument
    if [[ $# != 1 ]]; then
        echo "Expected one argument, directory where to place tools."
        return 1
    fi

    # Select binary based on the OS type.
    case $OSTYPE in
        darwin*) {
            echo "Downloading nRF Tools for Mac OS..."
            local nrf_tools_url="https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/nrf-command-line-tools/sw/versions-10-x-x/10-7-0/nrf-command-line-tools_10_7_0_osx.tar"
            local file_type="tar"
            local file_variant="mac"
        };;
        linux-gnu) {
            echo "Downloading nRF Tools for Linux..."
            local nrf_tools_url="https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/nrf-command-line-tools/sw/versions-10-x-x/10-7-0/nrfcommandlinetools1070linuxamd64.tar.gz"
            local file_type="tar.gz"
            local file_variant="linux"
        };;
        *) {
            echo "'$OSTYPE' OS is not supported."
            return 1
        };;
    esac

    # Prepare directory
    mkdir -p "$1"

    # Download tools
    curl "$nrf_tools_url" --output "$1.$file_type" || {
        echo "Failed to download nRF tools"
        return 1
    }

    # Unzip tools
    echo "Extracting nRF tools..."
    case $file_variant in
        "mac") {
            echo "Executing Mac specific steps..."
            mkdir -p "$1/tmp"
            tar -xf "$1.$file_type" -C "$1/tmp"
            local inner_archive=$(find . -name "nRF*Command*Line*.tar")
            tar -xf "$inner_archive" -C "$1"
            rm -rf "$1/tmp"
        };;
        "linux") {
            echo "Executing Linux specific steps..."
            mkdir -p "$1/tmp"
            tar -xzf "$1.$file_type" -C "$1/tmp"
            local inner_archive=$(find . -name "nRF*Command*Line*.tar.gz")
            tar -xzf "$inner_archive" -C "$1"
            rm -rf "$1/tmp"
        };;
        *) {
            echo "Extracting for variant $file_variant not supported"
            return 1
        };;
    esac

    # Merge folders
    merge_folders_inside "$1" || {
        echo "Failed to merge folder $1"
        return 1
    }

    # Check if proper directories are there as expected
    if [[ ! -d $NRFJPROG_DIR ]]; then
        echo "Extracting failed, cannot find nrfjprog..."
        rm -rf $1
        return 1
    fi

    if [[ ! -d $MERGEHEX_DIR ]]; then
        echo "Extracting failed, cannot find mergehex..."
        rm -rf $1
        return 1
    fi

    # Remove file
    rm "$1.$file_type"
}
