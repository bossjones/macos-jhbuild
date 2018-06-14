#!/bin/sh
#
# Script that sets up jhbuild, and the jhbuildrc files and moduleset
# files as symlinks from the git repository.
#
# Copyright 2007, 2008 Imendio AB
# Copyright 2016 Philip Chimento
#

set -x

SOURCE=..

do_exit()
{
    echo $1
    exit 1
}

if test x`which git` == x; then
    do_exit "Git isn't available, please install it and try again."
fi

if test ! -d $SOURCE; then
    do_exit "The directory $SOURCE does not exist, please create it and try again."
fi

echo "Checking out jhbuild from git..."
if ! test -d $SOURCE/jhbuild; then
    echo "yay $SOURCE/jhbuild doesnt exist"
else
    rm -rfv $SOURCE/jhbuild
fi

echo "Installing jhbuild configuration..."
rm -rfv ~/.config

echo "Replacing jhbuild's python symlink..."
rm -rfv ~/.local/

rm ~/.jhbuildrc-custom

echo "Done."
