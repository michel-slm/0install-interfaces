#!/bin/sh
for feed in 201*/*.xml; do
  0publish -x -k 44E980E1 ${feed}
done
