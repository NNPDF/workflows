DEST=$1
shift
DEPS=$@
PKG=$(basename $DEST | cut -d'.' -f1 | tr "-" "_")

SCRIPTS=
PATCHES=
GRIDS=

echo "  dest: $DEST"
for dep in $DEPS; do
  echo "  $(basename $dep)"
  case $dep in
  *.sh)
    SCRIPTS="${SCRIPTS} ${dep}"
    ;;
  *.patch)
    PATCHES="${PATCHES} ${dep}"
    ;;
  *.grid)
    GRIDS="${GRIDS} ${dep}"
    ;;
  esac
done

mkdir n3pkg/packages/$PKG

echo "package packages\n\n" >$DEST
echo "import _ \"embed\"" >>$DEST

for kind in SCRIPTS PATCHES GRIDS; do
  eval "files=\$$kind"
  echo "var (" >>$DEST

  mapname="${PKG}_$(echo $kind | tr [:upper:] [:lower:])"
  map="var $mapname = map[string]string{\n"

  for file in $files; do
    stem=$(basename $file | rev | cut -d'.' -f2- | rev | tr "-" "_")
    slug=$(basename $file | tr "." "_" | tr "-" "_")
    var="${PKG}_${slug}"
    name=$(basename $file)

    ln $file $(dirname $DEST)/$PKG/$name
    echo "    //go:embed $PKG/$name" >>$DEST
    echo "    $var string" >>$DEST
    map="$map    \"$stem\": $var,\n"

  done

  echo ")\n" >>$DEST
  map="$map}\n"
  echo $map >>$DEST
done

go fmt $DEST >/dev/null

echo $PKG >>"$(dirname $DEST)/packages"
