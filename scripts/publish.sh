#!/bin/sh
tar cf - dist/*.tar.* 201*/*.{gpg,x{ml,sl}} images | \
  alwaysdata \
    'cd www/0install && tar xf -'

