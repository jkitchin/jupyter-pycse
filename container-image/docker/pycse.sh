#!/bin/bash

#export JUPYTER_TOKEN=`uuidgen`

export JUPYTER_TOKEN='uuidgen'

docker run -d --name pycse -it --rm -p 8888:8888 -e JUPYTER_TOKEN -v "${PWD}":/home/jovyan/work pycse
sleep 2
echo "opening on http://localhost:8888/lab?token=${JUPYTER_TOKEN}"
# open http://localhost:8888/lab?token=${JUPYTER_TOKEN}

docker attach pycse
#end
