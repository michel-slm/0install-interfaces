#!/bin/sh
tar cf - dist/*.tar.* 201*/*.{gpg,x{ml,sl}} images | \
  metaarray \
    'cd interfaces && tar xf -'

