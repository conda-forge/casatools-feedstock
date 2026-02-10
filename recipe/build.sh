#! /bin/bash

set -xeuo pipefail
cd casatools
echo "$PKG_VERSION $PKG_VERSION - -" >version.txt

export CMAKE_GENERATOR="Ninja"
exec $PYTHON -m pip install . -vv --no-deps --no-build-isolation