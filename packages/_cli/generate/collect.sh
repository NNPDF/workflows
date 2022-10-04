PACKAGES=$(cat $1 | sort --unique)
DEST=$(dirname $1)/main.go

echo "package packages\n" >$DEST

for kind in scripts patches grids; do
  Kind=$(echo $kind | cut -c1 | tr [:lower:] [:upper:])$(echo $kind | cut -c2-)
  echo "var ${Kind} = map[string]map[string]string{" >>$DEST
  for pkg in $PACKAGES; do
    echo "    \"${pkg}\": ${pkg}_${kind}," >>$DEST
  done
  echo "}\n" >>$DEST
done

go fmt $DEST >/dev/null
