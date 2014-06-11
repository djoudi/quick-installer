# Disable the shopping search plugin (for privacy concerns)
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Switch to recursive search in Nautilus (I like it)
gsettings set org.gnome.nautilus.preferences enable-interactive-search false

# Install visionmedia/n
mkdir -p './git'
cd './git'
git clone 'https://github.com/visionmedia/n.git'
cd './n'
make install
# Fetch and install latest stable node.js and npm
n stable
cd '../..'