#!/bin/sh

export PATH="/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH"

brew install gettext yelp-tools itstool autoconf readline openssl sqlite icu4c

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/lib"

export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
# about readline
export CFLAGS="-I$(brew --prefix readline)/include $CFLAGS"
export LDFLAGS="-L$(brew --prefix readline)/lib $LDFLAGS"
# about openssl
export CFLAGS="-I$(brew --prefix openssl)/include $CFLAGS"
export LDFLAGS="-L$(brew --prefix openssl)/lib $LDFLAGS"
# about SQLite (maybe not necessary)
export CFLAGS="-I$(brew --prefix sqlite)/include $CFLAGS"
export LDFLAGS="-L$(brew --prefix sqlite)/lib $LDFLAGS"
export PKG_CONFIG_PATH="$(brew --prefix sqlite)/lib/pkgconfig:$PKG_CONFIG_PATH"
# about icu4c (maybe not necessary)
# SOURCE: https://stackoverflow.com/questions/12168975/pkg-config-and-osx-10-8-proper-pkg-config-path-missing-pc-files?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
export CPPFLAGS="-I$(brew --prefix icu4c)/include $CPPFLAGS"
export LDFLAGS="-L$(brew --prefix icu4c)/lib $LDFLAGS"

export LDFLAGS="-L$(brew --prefix gettext)/lib $LDFLAGS"
export CPPFLAGS="-I$(brew --prefix gettext)/include $CPPFLAGS"

# make sure it's python 2.7 before running the next step
