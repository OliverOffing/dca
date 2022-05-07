#!/usr/bin/env sh
set -xe
name="dca"
docker build -t "${name}" .
docker run --rm --user root -it --network host -e "USER=${USER}" -v "$(pwd):/home/"  "${name}" /bin/bash -c "jupyter notebook --allow-root"
