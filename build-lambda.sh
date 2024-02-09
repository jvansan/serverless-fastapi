#!/bin/sh
cd .venv/lib/python3.12/site-packages
echo "Zipping the dependencies"
zip -r9 ${OLDPWD}/function.zip .

echo "Zipping the app - cd to app directory ${OLDPWD}"
cd $OLDPWD
zip -g function.zip -r app
chmod 755 function.zip
mkdir -p out && mv function.zip out/