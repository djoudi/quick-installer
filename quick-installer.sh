#!/bin/bash

file_remove='./remove.txt'
file_install='./install.txt'
pre_install_tweaks='./pre-tweaks.sh'
post_install_tweaks='./post-tweaks.sh'
local_debs_dir='./deb'

remove=1;
install=1;
install_local=1;
tweaks=1;
update=1;

add_repo() {
    echo "Adding repository: $ppa"
    local command="add-apt-repository -y $1"
    $command;
}

update_repos() {
    echo "Updating repository cache..."
    local command="apt-get update"
    $command;
}

install_apps() {
    local command="apt-get install -y -m --force-yes $1"
    $command;
}

install_local_debs() {
    local command="dpkg -i -R '$1'"
    $command;
}

remove_apps() {
    local command="apt-get remove -y $1"
    $command;
}

update_apps() {
    local command="apt-get upgrade -y"
    $command;
}


do_tweaks() {
    echo "Doing the tweaks specified in \"$1\"..."
    local command="$1"
    $command;
}

# Remove unwanted apps
if [ $remove ]; then
    remove_apps "`cat $file_remove`"
fi

# Install apps
if [ $install ]; then

    # Do the pre-install tweaks
    if [ $tweaks -a "$pre_install_tweaks" ]; then
        do_tweaks "$pre_install_tweaks"
    fi

    ppas=`grep -o "^\s*ppa:\S*\s" "$file_install"`

    for ppa in $ppas; do
        add_repo "$ppa"
    done

    apps=`grep -v "^#" "$file_install" | sed s/'ppa:\S*\s'//`
    update_repos
    install_apps "$apps"
    if [ $install_local ]; then
        install_local_debs $local_debs_dir
    fi
fi

# Do the post-install tweaks
if [ $tweaks -a "$post_install_tweaks" ]; then
    do_tweaks "$post_install_tweaks"
fi

# Run system update
if [ $update ]; then
    update_apps
fi
