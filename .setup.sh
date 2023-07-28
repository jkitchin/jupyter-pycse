#!/bin/bash
# Put your customized setup commands here.

echo "PWD = `pwd`" > setup.log
echo "whoami = `whoami`" >> setup.log

[ -f requirements.txt ] && pip install -r requirements.txt
# end