#!/bin/bash
MYDIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

cd $MYDIR
BIN_BASE="simpleweb"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	GOOS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	GOOS="darwin"
else
	echo "Unsupported OS ${OSTYPE}"
	exit 1
fi

CMD="go build -v -o ${MYDIR}/bin/${BUILD_BASE}-${GOOS}"

echo "Running: $CMD"
eval "$CMD"
