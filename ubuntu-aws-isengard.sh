#!/bin/sh

set -ex

PYTHON=python3
PIP="sudo -H pip3"

WORKDIR=`mktemp -d -t cli-work-dir.XXX`
pushd .
cd $WORKDIR

# install build prerequisites
$PIP install --upgrade pytest

# build and install plugin packages
for PKG in BenderLibIsengard AwsCliIsengardPlugin; do
  git clone ssh://git.amazon.com/pkg/$PKG
  pushd .
    cd $PKG
    $PYTHON setup.py sdist
    $PIP install --upgrade dist/*.tar.gz
  popd
done

popd
rm -rf $WORKDIR
