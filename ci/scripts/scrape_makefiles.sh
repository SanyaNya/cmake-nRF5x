#!/bin/bash

set -e

source "${BASH_SOURCE%/*}/common/consts.sh"
source "${BASH_SOURCE%/*}/common/check_deps.sh"
source "${BASH_SOURCE%/*}/common/python.sh"
source "${BASH_SOURCE%/*}/common/utils.sh"

mkdir -p "$GENERATED_DIR"

for sdk in `ls -d $SDKS_DIR/*`; do
    files="$files $(find -L "${sdk}" -regex ".*/examples/.*/armgcc/Makefile")"
done

echo "$files" | invoke_py3 "${PYTHON_DIR}/scrape_makefiles.py" --output "$GENERATED_EXAMPLES"
