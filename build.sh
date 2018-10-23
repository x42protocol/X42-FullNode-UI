#!/bin/bash

# exit if error
set -o errexit

# print out a few variables
echo "current environment variables:"
echo "OS name:" $TRAVIS_OS_NAME
echo "Platform:" $os_platform
echo "Build directory:" $TRAVIS_BUILD_DIR
echo "Node version:" $TRAVIS_NODE_VERSION
echo "Architecture:" $arch
echo "Configuration:" $configuration
echo "dotnet resources path in app:" $dotnet_resources_path_in_app
echo "Branch:" $TRAVIS_BRANCH
echo "Tag:" $TRAVIS_TAG
echo "Commit:" $TRAVIS_COMMIT
echo "Commit message:" $TRAVIS_COMMIT_MESSAGE


dotnet --info

# Initialize dependencies
echo $log_prefix STARTED restoring dotnet and npm packages
cd $TRAVIS_BUILD_DIR
git submodule update --init --recursive

cd $TRAVIS_BUILD_DIR/FullNode.UI

npm install
npm install -g npx
echo $log_prefix FINISHED restoring dotnet and npm packages

# dotnet publish
echo $log_prefix running 'dotnet publish'
cd $TRAVIS_BUILD_DIR/X42-FullNode/src/x42.x42D
dotnet publish -c $configuration -r $TRAVIS_OS_NAME-$arch -v m -o $TRAVIS_BUILD_DIR/FullNode.UI/daemon

echo $log_prefix chmoding the x42.x42D file
chmod +x $TRAVIS_BUILD_DIR/FullNode.UI/daemon/x42.x42D

# node Build
cd $TRAVIS_BUILD_DIR/FullNode.UI
echo $log_prefix running 'npm run'
npm run build:prod

# node packaging
echo $log_prefix packaging FullNode.UI 
if [ "$TRAVIS_OS_NAME" = "osx" ]
then
  npx electron-builder build --mac --$arch
elif [ ${OS} == "arm"]
  npx electron-builder build --linux --armv7l
else
  npx electron-builder build --linux --$arch
fi

echo $log_prefix finished packaging

#tests
echo $log_prefix no tests to run

echo $log_prefix contents of TRAVIS_BUILD_DIR
cd $TRAVIS_BUILD_DIR
ls

echo $log_prefix contents of the app-builds folder
cd $TRAVIS_BUILD_DIR/FullNode.UI/app-builds/
# replace the spaces in the name with a dot as CI system have trouble handling spaces in names.
for file in *.{dmg,tar.gz,deb}; do mv "$file" `echo $file | tr ' ' '.'` 2>/dev/null || : ; done

ls

echo $log_prefix FINISHED build

