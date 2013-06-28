#!/bin/bash
# generate php tags file for tagbar

#find ./ -not -name template -name '*.php' -exec phpctags -f tags -a {} \;
find ./ -name '*.php' -exec phpctags -f tags -a {} \;
sort tags --output tags
