# early exit if errors occur
set -e

INSTALLER_DIR=$(realpath $(dirname $0))

# import variables
. $INSTALLER_DIR/variables.sh

# download the code
sh $INSTALLER_DIR/download.sh $URL $TARBALL

# extract code
tar -xvzf $TARBALL
cd $SRC_DIR
rm -rf build
mkdir build && cd build

# if PREFIX is set use it, otherwise do the default
if [ -z $PREFIX ]; then
  cmake .. 
else
  echo "Installing in $PREFIX"
  cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
fi

# compile, and install (includes python interface)
make -j && make install
