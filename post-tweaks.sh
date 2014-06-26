#!/bin/bash

old_dir=$(pwd)

# Disable the shopping search plugin (for privacy concerns)
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Switch to recursive search in Nautilus (I like it)
gsettings set org.gnome.nautilus.preferences enable-interactive-search false

# # Tweak Copy client
/opt/copy-client/CopyAgent -installOverlay

# # Restart nautilus
nautilus -q

./install-node.sh

cd "$old_dir"

# disable guest user
# echo '[SeatDefaults]
# user-session=ubuntu
# greeter-session=unity-greeter
# allow-guest=false' > /etc/lightdm/lightdm.conf