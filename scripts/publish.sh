#!/bin/sh
cd dist
DIRS=$(find * -maxdepth 0 -type d)
for d in ${DIRS}; do
  tar cjf ${d}.tar.bz2 ${d}
done
cd ..
tar cf - dist/*.tar.* *.xsl 201*/*.{gpg,xml} | \
  ssh forge-0install@faui2o2b.informatik.uni-erlangen.de \
    'cd interfaces && tar xf -'

