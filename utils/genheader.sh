# header for fuzzer generate.sh scripts

if [ -z "$XRAY_DATABASE" ]; then
	echo "No XRAY environment found. Make sure to source the settings file first!"
	exit 1
fi

set -ex

# for some reason on sourced script set -e doesn't work
test $# = 1 || exit 1
test ! -e "$1"
mkdir "$1"
cd "$1"

export SEED="$(echo $1 | md5sum | cut -c1-8)"

function seed_vh () {
    echo '`define SEED 32'"'h${SEED}" > setseed.vh
}

