#!/bin/bash
MYDIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

cd $MYDIR

GOOS=""
BIN_BASE="local-libs"

if [[ "$1" != "all" ]] ; then
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
		GOOS="linux"
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		GOOS="darwin"
	fi
fi

if [[ "${GOOS}" != "" ]] ; then
	echo "Building specific binary: ${GOOS}"
	CMD="go build -v -o ${MYDIR}/bin/${BIN_BASE}-${GOOS}"
	echo "Running: $CMD"
	eval "$CMD"
else
	# Build Linux binary
	GOOS="linux"
	echo "Building specific binary: ${GOOS}"
	CMD="go build -v -o ${MYDIR}/bin/${BIN_BASE}-${GOOS}"
	echo "Running: $CMD"
	eval "$CMD"

	# Build MacOSX binary
	GOOS="darwin"
	echo "Building specific binary: ${GOOS}"
	CMD="go build -v -o ${MYDIR}/bin/${BIN_BASE}-${GOOS}"
	echo "Running: $CMD"
	eval "$CMD"

	# Build Windows binary
	GOOS="windows"
	echo "Building specific binary: ${GOOS}"
	CMD="go build -v -o ${MYDIR}/bin/${BIN_BASE}.exe"
	echo "Running: $CMD"
	eval "$CMD"

fi


