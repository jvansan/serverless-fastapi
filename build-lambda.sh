#!/bin/sh
py_exclude=('*.pyc' '*__pycache__*')

cd .venv/lib/python3.12/site-packages
echo "Zipping the dependencies"
zip -r9 ${OLDPWD}/function.zip . -x "${py_exclude[@]}"

echo "Zipping the app - cd to app directory ${OLDPWD}"
cd $OLDPWD
zip -g function.zip -r app -x "${py_exclude[@]}"
chmod 755 function.zip
mkdir -p out && mv function.zip out/