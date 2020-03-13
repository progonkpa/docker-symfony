#!/bin/sh

if [  -f "package.json" ] && [ ! -d "node_modules" ]
then
  echo node_modules not detected in volume mount
  echo executing npm install...
  npm install
fi

gulp

exit 0
