#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Run nvflare20 script ..."
echo "install nvflare"
pip install nvflare==2.0.6 Pillow==8.2.0

chmod +x $DIR/bootstrap.sh
$DIR/bootstrap.sh

