#!/bin/bash

##### Interactive script by C9 (@C922A10971734)
# Original script and contributions by @DavoedM and @nuga99
#

##### License 
# GNU General Public License v2.0 (GPL-2.0)
#
# https://www.tldrlegal.com/license/gnu-general-public-license-v2

##### Warranty
#
# I (@C922A10971734) am not responsible for anything you do with this script.

choose_distro(){
    distro_choices=($(curl -s https://download.docker.com/linux/ | grep -oP '<a href=".+?">(?!\...)\K.+?(?=\/<)'))
    for ((i=0; i<${#distro_choices[@]}; ++i)); do
        args+=("$i" "${distro_choices[$i]}")
    done
    #require setting to variable first to fix syntax highlighting in VSCode
    num=$(whiptail --title "Available Distros" --menu --notags --nocancel "Choose a distribution (if you're on ParrotOS you'll likely want debian)" 25 78 16 "${args[@]}" 3>&1 1>&2 2>&3)
    distro_choosen=${distro_choices[num]}
    null_error_check $distro_choosen
    args=()
}

# centos fails for now because /dists/ is not the proper URL
choose_codename(){
    codename_choices=($(curl -s https://download.docker.com/linux/$distro_choosen/dists/ | grep -oP '<a href=".+?">(?!\...)\K.+?(?=\/<)'))
    for ((i=0; i<${#codename_choices[@]}; ++i)); do
        args+=("$i" "${codename_choices[$i]}")
    done
    #require setting to variable first to fix syntax highlighting in VSCode
    num=$(whiptail --title "Available Builds" --menu --notags --nocancel "Choose a build name" 25 78 16 "${args[@]}" 3>&1 1>&2 2>&3)
    codename_choosen=${codename_choices[num]}
    args=()
}

choose_arch(){
    temp=($(curl -s https://download.docker.com/linux/debian/dists/bullseye/stable/ | grep -oP '<a href=".+?">(?!\...)\K.+?(?=\/<)'))
    for ((i=0; i<${#temp[@]}; ++i)); do
        arch_choices+=($(echo ${temp[$i]} | cut -d '-' -f 2))
    done
    for ((i=0; i<${#arch_choices[@]}; ++i)); do
        args+=("$i" "${arch_choices[$i]}")
    done
    #require setting to variable first to fix syntax highlighting in VSCode
    num=$(whiptail --title "Available Archs" --menu --notags --nocancel "Choose an arch" 25 78 16 "${args[@]}" 3>&1 1>&2 2>&3)
    arch_choosen=${arch_choices[num]}
    args=()
}

contrib_statement(){
    welcome="Docker installation script for Debian-like package systems"
    statement="Built with love by @C922A10971734, original contributions by " 
    for ((i = 0; i < ${#contributors[@]}; ++i)); do
        if [[ i+1 -lt ${#contributors[@]} ]]
        then
            statement+="${contributors[$i]}, "
        else
            statement+="and ${contributors[$i]}."
        fi
    done
    whiptail --title "$welcome" --msgbox "$statement" 8 78
}

function null_error_check(){
    if [ -z "$1" ]
    then 
        echo "value provided was null"; exit 0
    elif printf '%s\0' "${unsupported_distros[@]}" | grep -Fxqz -- "$1";
    then
        echo "($1) This OS option is not currently supported by the script"; exit 0;
    fi
}

function confirm_whiptail(){
    selection=$(whiptail --title "$1" --yesno "$2" 25 78 16 3>&1 1>&2 2>&3)
}

function run_install(){
    # Install docker.
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    echo "deb [arch=$arch_choosen] https://download.docker.com/linux/$distro_choosen $codename_choosen stable" | \
    sudo tee /etc/apt/sources.list.d/docker-engine.list

    sudo apt-get update -y
    sudo apt-get install -y docker-ce

    # Run docker.
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add user to docker group for using docker without sudo command.
    sudo gpasswd -a "${USER}" docker

    confirm_whiptail "Reboot Machine?" "Docker has been installed successfully, a reboot is required, proceed with reboot?" && sudo reboot
    
}

#used for testing
function run_install_fake(){
    echo "Running install (fake for testing)"
    exit 0
}

contributors=(@nuga99 @DavoedM)
unsupported_distros=("centos" "fedora" "rhel" "sles" "static")
main(){
    contrib_statement
    choose_distro
    choose_codename
    choose_arch

    # Used for testing/debugging without having to do actual install
    if [ "$1" = "test" ];
    then
        install_mode=run_install_fake
    else
        install_mode=run_install
    fi

    confirm_whiptail "Confirm Installation" "You've choosen to install $distro_choosen - $codename_choosen on $arch_choosen, continue?" && $install_mode
}

main $1 #pass script args to main