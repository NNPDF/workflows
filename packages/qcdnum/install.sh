# early exit if errors occur
set -e

INSTALLER_DIR=$(realpath $(dirname $0))

# import variables
. $INSTALLER_DIR/variables.sh

# download the code
sh $INSTALLER_DIR/download.sh $URL $TARBALL

# extract code
tar -xvzf $TARBALL
cp -r pyWrap $SRC_DIR
cd $SRC_DIR

# apply patch to add missing argument in function call
for p in $INSTALLER_DIR/*.patch; do
  echo "Applying patch: '$p'"
  patch <$p -p1
done

# reconfigure
autoreconf -f -i
# if PREFIX is set use it, otherwise do the default
if [ -z $PREFIX ]; then
  FFLAGS='-fallow-argument-mismatch' ./configure
else
  echo "Installing in $PREFIX"
  FFLAGS='-fallow-argument-mismatch' ./configure --prefix=$PREFIX
fi

# reset, compile, and install
make clean
make -j
make install

# compile and install python interface
cd pyWrap
sh f2py.sh
pip install .
