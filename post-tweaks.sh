#!/bin/bash

old_dir=$(pwd)

# Disable the shopping search plugin (for privacy concerns)
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Switch to recursive search in Nautilus (I like it)
gsettings set org.gnome.nautilus.preferences enable-interactive-search false

# Install visionmedia/n
git clone 'https://github.com/visionmedia/n.git' --depth 1
cd './n'
make install
# Fetch and install latest stable node.js and npm
n stable
cd '..'
rm -R  './n'

# # Tweak Copy client
# /opt/copy-client/CopyAgent -installOverlay

# # Fix libdbusmenu issue for CopyAgent
# # Source: http://www.webupd8.org/2014/06/fix-copycom-indicator-menu-for-ubuntu.html
# cd /tmp
# wget https://github.com/hotice/webupd8/raw/master/libdbusmenu-gtk-$(arch).tar.gz
# tar -xvf libdbusmenu-gtk*
# sudo cp /tmp/libdbusmenu-gtk*/* /opt/copy-client/

# # Restart nautilus
# nautilus -q

cd "$pwd"