#!/bin/bash -x
BUILDID="`docker build . | tail -n 1 | sed 's/.* //'`"
docker run -v "`pwd`/test-archive/":"/media/archive" $BUILDID $@