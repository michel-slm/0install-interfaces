#!/bin/sh
if [ -z '$@' ]; then
  FEEDS="201*/*.xml"
else
  FEEDS="$@"
fi
for feed in ${FEEDS}; do
  0publish -x -k 44E980E1 ${feed}
done
