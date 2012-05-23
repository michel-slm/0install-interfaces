#!/bin/sh
if [ -z '$@' ]; then
  FEEDS="201*/*.xml"
else
  FEEDS="$@"
fi
for feed in ${FEEDS}; do
  0publish -u -x -k A36A937A ${feed}
done
