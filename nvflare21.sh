#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Run nvflare21 script ..."
echo "install nvflare"
pip install nvflare==2.1.3 Pillow==8.2.0

if [ "$(pip list | awk '/pytorch/ {print }'|wc -l)" -ge 1 ]; then
  pip install monai
else
  echo "pytorch not found"
fi

pip install --upgrade "protobuf<=3.20.1"
chmod +x $DIR/*.sh
$DIR/bootstrap.sh
