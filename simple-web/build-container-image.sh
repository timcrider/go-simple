#!/bin/bash
MYDIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

cd $MYDIR

DOCKTAG="demo-golang-simpleweb:latest"

if [[ "$1" != "" ]] ; then
	DOCKTAG="$1"
fi

CMD="docker build --tag $DOCKTAG ."

echo "Running: $CMD"
eval "$CMD"
