#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Run nvflare20 script ..."
echo "install nvflare"
pip install nvflare==2.0.14 Pillow==8.2.0

if [ "$(pip list | awk '/pytorch/ {print }'|wc -l)" -ge 1 ]; then
  pip install monai
else
  echo "pytorch not found"
fi

chmod +x $DIR/*.sh
cp $DIR/signature.py /opt/conda/lib/python3.8/site-packages/nvflare/lighter/impl/

echo "cd /workspace" >> /root/.bashrc


$DIR/bootstrap.sh

