URL=$1
TARBALL=$2

INSTALLER_DIR=$(realpath $(dirname $0))
cp $INSTALLER_DIR/../.backup/FONLLdis.tar.gz $TARBALL
