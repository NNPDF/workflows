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

# apply patches
for p in $INSTALLER_DIR/*.patch; do
  echo "Applying patch: '$p'"
  patch <$p -p1
done

make clean
make

cd pyWrap
# activate your environment, so f2py already points to the correct thing
sh f2py.sh
pip install .

exit
