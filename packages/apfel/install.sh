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

# apply patches
# for p in $INSTALLER_DIR/*.patch; do
# echo "Applying patch: '$p'"
# patch <$p -p1
# done

# reconfigure
autoreconf -f -i
# if PREFIX is set use it, otherwise do the default
if [ -f $PREFIX ]; then
  PYTHON=$(which python3) ./configure
else
  echo "Installing in $PREFIX"
  PYTHON=$(which python3) ./configure --prefix=$PREFIX
fi

# reset, compile, and install (includes python interface)
make clean
make -j
make install
