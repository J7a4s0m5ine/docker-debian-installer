# Table of Contents
1. [Usage](#usage)
2. [Origin](#origin)
3. [Supported Operating Systems](#supported-operating-systems)
4. [Screenshots](#screenshots)
5. [Contributing](#contributing)
6. [The Possible Future](#things-to-fix-and-or-provide-as-new-features)
7. [License](#license)
8. [Warranty](#warranty)


# Docker Debian Interactive Installer

This small script allows a user to add proper sources (debs) to their debian based installation interactively for a smooth and quick experience. Install Docker on any debian distro interactively!

## Usage

Simply run this in your terminal. Always, ALWAYS review code and sources you run on your computers.

The choices for distro/build name requires some intuition and research. For example if you're using ParrotOS 5.3 (Ara), you'll want to choose Debian Bullseye from the selection lists.

``` bash
wget -O - https://raw.githubusercontent.com/C922A10971734/docker-debian-installer/main/docker-debian-interactive-install.sh | bash
```

From space with 💕,
J7a4s0m5ine

### Origin

The story of this script comes from [a gist originally created by @nuga99](https://gist.github.com/nuga99/dd5ac250b4c98154b5065d8affec7b49), eventually I started contributing and took the script in a different direction to allow it to be interactive and dynamic.

#### Supported Operating Systems
- Tails
- Ångström distribution
- AntiX
- Armbian
- Astra Linux
- AV Linux
- BackBox
- Bharat Operating System Solutions
- BlankOn Linux
- Canaima
- Commodore OS
- Corel Linux
- CrunchBang Linux
- Damn Small Linux
- Debian Pure Blend
- Debian-Med
- Deepin
- Devuan
- DoudouLinux
- Dreamlinux
- Dyson
- Elementary OS
- Emdebian Grip
- Emmabuntüs
- Finnix
- FreedomBox
- GLinux
- GNewSense
- Google Cloud Shell
- Grml
- Guadalinex
- HandyLinux
- Huayra GNU/Linux
- Kaisen Linux
- Kali Linux
- Kali NetHunter
- Kanotix
- KDE neon
- Knoppix
- Libranet
- LiMux
- Linspire
- Linux Mint Debian Edition
- The Linux Schools Project
- Maemo
- MEPIS
- Musix GNU+Linux
- MX Linux
- OpenZaurus
- Pardus
- Parrot OS
- Parsix
- Proxmox Virtual Environment
- Puavo
- PureOS
- Q4OS
- Raspberry Pi OS (Raspbian)
- Skolelinux
- Slax
- SolydXK
- SONiC
- SparkyLinux
- SteamOS
- Subgraph
- Sunwah Linux
- TurnKey Linux Virtual Appliance Library
- Ubuntu
- Univention Corporate Server
- UserLinux
- USU
- Vyatta
- VyOS
- Webconverger
- Wienux

### Screenshots

#### Distro Selection
![image](https://user-images.githubusercontent.com/122838399/256328515-5e1cc84b-6f4a-4da9-b6c3-d06d5d66d587.png)

#### Build Selection
![image](https://user-images.githubusercontent.com/122838399/256329054-1447dcab-5dd0-45bf-ba09-92ec58898b75.png)

#### Arch Selection
![image](https://user-images.githubusercontent.com/122838399/256329136-34e03c14-fb34-4cae-9e4f-4346126f9f6c.png)

#### Installation Confirmation
![image](https://user-images.githubusercontent.com/122838399/256329219-fe94b056-884f-43d6-8d62-69bc1bce9b0a.png)

#### Reboot Confirmation
![image](https://user-images.githubusercontent.com/122838399/256332022-771806fe-ae78-4ee7-bc69-8919a4b752a2.png)


### Contributing

Feel free to fork and contribute, send a pull request with any changes. Easy. as. pie. Okay let's be honest, making a pie from scratch is harder than sending a pull request.

### Things to fix and or provide as new features:

- Check if docker is installed/Allow for uninstall or changes
- Check if previous entry in sources.lists exists
     - Delete all entries in sources.lists
- Change window size to be dynamic
- Provide functions for non-debian systems
- Generalize the entire approach to be able to provide an apt HTTP URL and install anything!!

### License
GNU General Public License v2.0 (GPL-2.0)
https://www.tldrlegal.com/license/gnu-general-public-license-v2

### Warranty
I (@C922A10971734) am not responsible for anything you do with this script.
