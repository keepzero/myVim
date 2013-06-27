#!/bin/bash
# generate tag file for lookupfile plugin

FIND_COMMAND=find
if [[ -f /usr/local/bin/find ]]; then
    # Mac's default find not have -printf option
    FIND_COMMAND=/usr/local/bin/find
fi

echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags

$FIND_COMMAND . \( -name .svn -o -wholename ./classes \) \
    -prune -o -not -iregex '.*\.\(jar\|gif\|png\|jpg\|class\|exe\|dll\|sw[op]\|xls\|doc\|pdf\|zip\|ico\).*' \
    -type f -printf "%f\t%p\t1\n" | \
    sort -f >> filenametags
