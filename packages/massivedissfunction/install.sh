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

# reset, compile, and install (includes python interface)
make

