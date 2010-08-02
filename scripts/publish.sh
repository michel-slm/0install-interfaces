#!/bin/sh
tar cf - dist/*.tar.* *.xsl 201*/*.{gpg,xml} images | \
  ssh forge-0install@faui2o2b.informatik.uni-erlangen.de \
    'cd interfaces && tar xf -'

