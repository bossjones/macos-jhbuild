#!/bin/sh

brew install gettext yelp-tools itstool autoconf

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PKG_CONFIG_PATH="$(brew --prefix/share/pkgconfig)"


# make sure it's python 2.7 before running the next step
