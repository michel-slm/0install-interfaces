#!/bin/sh
cd dist
DIRS=$(find * -maxdepth 0 -type d)
for d in ${DIRS}; do
  tar cjf ${d}.tar.bz2 ${d}
done
cd ..
