#!/bin/sh
tar cf - dist/*.tar.* 201*/*.{gpg,x{ml,sl}} images | \
  ssh forge-0install@faui2o2b.informatik.uni-erlangen.de \
    'cd interfaces && tar xf -'

