#!/bin/sh
tar cf - *.xsl 201*/*.{gpg,xml} | \
  ssh forge-0install@faui2o2b.informatik.uni-erlangen.de \
    'cd interfaces && tar xf -'
