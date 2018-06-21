## macos-jhbuild ##

Temporary repository with the necessary configuration to build GNOME modulesets using jhbuild on macOS.

### Requirements ###
- macOS 10.9 or later
- Xcode

### How to use ###
- Make sure command line tools are installed (`xcode-select --install`)
- `git clone https://github.com/ptomato/macos-jhbuild`
- `cd macos-jhbuild`
- `./setup.sh`
- Make sure `~/.local/bin` is in your `PATH`
- Edit `~/.jhbuildrc-custom` as desired
- If you intend to make app bundles you must temporarily unlink your Homebrew modules until you're done building: `brew list -1 | while read line; do brew unlink $line; done` (ask `brew doctor` how to get them back)
- `jhbuild bootstrap`
- `cd` to your install directory (whatever you put as `prefix` in `~/.jhbuildrc-custom`)
- `cp _jhbuild/root-dbus-broken/Library/LaunchAgents/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/`
- `rm -r _jhbuild/root-dbus-broken`
- `jhbuild run dbus-uuidgen --ensure=var/lib/dbus/machine-id`
- `jhbuild sysdeps` and make sure nothing looks odd
- `jhbuild list` and make sure nothing looks odd
- `jhbuild build`

### Modules that currently need patches or changes ###
For `meta-gnome-extended-devel-platform`:
- pygobject: https://bugzilla.gnome.org/show_bug.cgi?id=773803
- libpeas: https://bugzilla.gnome.org/show_bug.cgi?id=774175
- libsecret: https://bugzilla.gnome.org/show_bug.cgi?id=734630



# jhbuild-modulesets for fast bootstrapping ( via https://github.com/krichter722/jhbuild-modulesets which pyenv example )
## Initialization
Steps to do:

  * get `jhbuild` (tarball from https://developer.gnome.org/jhbuild/ or with `git` from https://github.com/GNOME/jhbuild)
  * build `jhbuild` with `./autogen.sh && make && make install` and add `$HOME/.local/bin/jhbuild` to your `PATH` environment variable

Now you can build with

```
jhbuild --file=$HOME/jhbuild-modulesets/.jhbuildrc --moduleset=$HOME/jhbuild-modulesets/jhbuild-modules.modules build --nodeps [module name]
```
