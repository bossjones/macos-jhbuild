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
    (cd $SOURCE ; git clone git://git.gnome.org/jhbuild )
else
    (cd $SOURCE/jhbuild ; git pull >/dev/null)
fi

echo "Installing jhbuild..."
(cd $SOURCE/jhbuild ; ./autogen.sh >/dev/null && make >/dev/null && make install >/dev/null)

echo "Installing jhbuild configuration..."
mkdir -p ~/.config
/bin/ln -sfh `pwd`/jhbuildrc ~/.config/jhbuildrc
if [ ! -f ~/.jhbuildrc-custom ]; then
    cp jhbuildrc-custom-example ~/.jhbuildrc-custom
fi

echo "Setting up extra jhbuild files..."
for mod in modulesets/*.modules patches/*.patch; do
    /bin/ln -sfh `pwd`/$mod $SOURCE/jhbuild/$mod
done

echo "Replacing jhbuild's python symlink..."
rm ~/.local/bin/python2
echo '#!/bin/bash' >~/.local/bin/python2
echo 'exec /usr/bin/python "$@"' >>~/.local/bin/python2
chmod +x ~/.local/bin/python2

echo "Installing ninja..."
curl -LO https://github.com/ninja-build/ninja/releases/download/v1.7.2/ninja-mac.zip
unzip -o ninja-mac.zip ninja -d ~/.local/bin
rm ninja-mac.zip

echo "Done."
