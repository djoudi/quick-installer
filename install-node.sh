node_modules_file='./global-node-modules.txt'

# Install visionmedia/n
install_node() {
    git clone 'https://github.com/visionmedia/n.git' --depth 1
    cd './n'
    make install
    # Fetch and install latest stable node.js and npm
    cd '..'
    rm -R  './n'
    n $1
}

install_node_modules() {
    command="npm install -g $@"
    $command;
}

install_node 'stable'
install_node_modules $(cat "$node_modules_file")