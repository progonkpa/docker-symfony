#!/bin/sh

# What this script does:
# 1. Run 'npm install' if package.json file is present but no node_modules directory.
# 2. Install Gulp with CLI.
# 3. Install Gulp LiveReload.
# 4. Execute gulp, starts a LiveReload server.

installCount=0

if [ "$SRC_DIR_GUEST" = '' ]
then
  echo Envirmont variable '$SRC_DIR_GUEST' is not set.
  echo Aborting setup-node.sh execution...
  exit 0
fi

if [  -f "$SRC_DIR_GUEST/package.json" ] && [ ! -d "$SRC_DIR_GUEST/node_modules" ]
then
  echo node_modules not detected in sources directory \'"$SRC_DIR_GUEST"\'
  echo executing npm install...
  npm install
  installCount=`expr $installCount + 1`
fi

if [ ! -f "$SRC_DIR_GUEST/package.json" ]
then
cat <<EOF > "$SRC_DIR_GUEST/package.json"
{
  "name": "package_name",
  "version": "1.0.0"
}
EOF
fi

if [ ! -d "$SRC_DIR_GUEST/node_modules/gulp" ] || [ ! -d "$SRC_DIR_GUEST/node_modules/gulp-cli" ]
then
  echo Gulp not found, installing Gulp...
  npm install --save-dev gulp gulp-cli
  installCount=`expr $installCount + 1`
fi

if [ ! -d "$SRC_DIR_GUEST/node_modules/gulp-livereload" ]
then
  echo Gulp Livereload not found, installing Gulp Livereload...
  npm install --save-dev gulp-livereload
  installCount=`expr $installCount + 1`
fi

if [ "$installCount" -gt 0 ]
then
  echo Install Node dependencies done!
else
  echo Node dependencies found, skipping installation...
fi

# Prevent container from closing.
#tail -f /dev/null

gulp

exit 0
