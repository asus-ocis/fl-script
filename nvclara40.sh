#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Run nvclara40 script ..."

chmod +x $DIR/bootstrap.sh
$DIR/bootstrap.sh

