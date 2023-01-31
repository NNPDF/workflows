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

cd Routines
sed -i 's/g77/f77/g' G77-obj
sh G77-obj
cd ..

# compile and install python interface
if [ -z $PREFIX/bin/activate ]; then
  # if prefix specified and environment executable, activate it
  . $PREFIX/bin/activate
fi
cd pyWrap
sh f2py.sh
pip install .
