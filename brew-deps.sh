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

# export OPENSSL_INCLUDE_DIR="$(brew --prefix openssl)/include"
# export OPENSSL_LIB_DIR="$(brew --prefix openssl)/lib"

# make sure it's python 2.7 before running the next step

# MORE: https://github.com/facebook/hhvm/wiki/Building-and-installing-HHVM-on-OSX-10.8-With-Homebrew
# CMAKE_INCLUDE_PATH="/usr/local/include:/usr/include" \
# CMAKE_LIBRARY_PATH="/usr/local/lib:/usr/lib" \
# ICU_INCLUDE_DIR=$(brew --prefix icu4c)/include \
# ICU_LIBRARY=$(brew --prefix icu4c)/lib/libicuuc.dylib \
# ICU_I18N_LIBRARY=$(brew --prefix icu4c)/lib/libicui18n.dylib \
# ICU_DATA_LIBRARY=$(brew --prefix icu4c)/lib/libicudata.dylib \
# READLINE_INCLUDE_DIR=$(brew --prefix readline)/include \
# READLINE_LIBRARY=$(brew --prefix readline)/lib/libreadline.dylib \
# NCURSES_LIBRARY=$(brew --prefix ncurses)/lib/libncurses.dylib \
# CURL_INCLUDE_DIR=$(brew --prefix curl)/include \
# CURL_LIBRARY=$(brew --prefix curl)/lib/libcurl.dylib \
# BOOST_INCLUDEDIR=$(brew --prefix boost)/include \
# BOOST_LIBRARYDIR=$(brew --prefix boost)/lib \
# Boost_USE_STATIC_LIBS=ON \
# JEMALLOC_INCLUDE_DIR=$(brew --prefix jemalloc)/include \
# JEMALLOC_LIB=$(brew --prefix jemalloc)/lib/libjemalloc.dylib \
# LIBINTL_LIBRARIES=$(brew --prefix gettext)/lib/libintl.dylib \
# LIBINTL_INCLUDE_DIR=$(brew --prefix gettext)/include \
# LIBDWARF_LIBRARIES=$(brew --prefix libdwarf)/lib/libdwarf.3.dylib \
# LIBDWARF_INCLUDE_DIRS=$(brew --prefix libdwarf)/include \
# LIBMAGICKWAND_INCLUDE_DIRS=$(brew --prefix imagemagick)/include/ImageMagick-6 \
# LIBMAGICKWAND_LIBRARIES=$(brew --prefix imagemagick)/lib/libMagickWand-6.Q16.dylib \
# MYSQL_INCLUDE_DIR=$(brew --prefix mysql-connector-c)/include \
# MYSQL_LIB=$(brew --prefix mysql-connector-c)/lib
