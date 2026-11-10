#! /bin/bash

set -xeuo pipefail

# Due to the (current) source URL format, rattler-build won't automatically
# decompress the source tarball, so we have to do that and apply patches
# manually.
tar xzf casa-*.tar.gz
rm -f casa-*.tar.gz
if [ $(uname) = Darwin ] ; then
    patch -p1 -i $RECIPE_DIR/macos-not-gcc.patch
fi

cd casatools
echo "$PKG_VERSION $PKG_VERSION - -" >version.txt

export CMAKE_GENERATOR="Ninja"
exec $PYTHON -m pip install . -vv --no-deps --no-build-isolation