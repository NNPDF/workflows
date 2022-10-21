BACKUP_DIR=$(realpath $(dirname $0))
ROOT=$(realpath $BACKUP_DIR/..)

echo "Refetching all sources from: '$ROOT'"
echo "  -> store them in '$BACKUP_DIR'"
echo

for ext in $ROOT/*/; do
  if [ ! -f $ext/variables.sh ]; then
    continue
  fi

  . $ext/variables.sh
  sh $ext/download.sh $URL $BACKUP_DIR/$TARBALL
done
