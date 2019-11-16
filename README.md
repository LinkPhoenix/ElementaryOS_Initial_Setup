## Contents
 - [Getting Started](#getting-started)
    - [Installing](#Installing)
        - [Via curl](#via-curl)
        - [Via wget](#via-wget)
        - [Manual installation](#manual-installation)
 - [Compatibility](#compatibility)
 - [Help](#help)
 - [All configurations](#all-configurations)
    - [Install](#install)
    - [Elementary OS Configuration](#elementary-os-configuration)
    - [Uninstall](#uninstall)

<h1 align="center">
    <img alt="Elementary OS Script install" src="https://user-images.githubusercontent.com/33618968/68996005-a387f600-0894-11ea-95bb-e83fdc7a9ca8.png" width="800">
  <br>Elementary OS Inital Setup<br>
</h1>

# Getting Started
## Installing
### Via curl

    bash -c "$(curl -fsSL https://raw.githubusercontent.com/LinkPhoenix/ElementaryOS_Initial_Setup/master/install.sh)"

### Via wget

    bash -c "$(wget https://raw.githubusercontent.com/LinkPhoenix/ElementaryOS_Initial_Setup/master/install.sh -O -)"

### Manual installation

##### 1. Clone the repository:

    git clone git@github.com:LinkPhoenix/ElementaryOS_Initial_Setup.git

##### 2. Move to the directory:

    cd ElementaryOS_Initial_Setup

##### 3. Launch the script with bash

    bash ./install.sh

# Compatibility

|     OS Name     | Version |   Code name   |
|     :-----:     | ------- | ------------- |
|  Elementary OS  |   5.0   |      JUNO     |


# Help

[Tips and tricks](https://github.com/LinkPhoenix/ElementaryOS_Initial_Setup/blob/master/Pages/Tips_and_tricks.md)

# All configurations

## Install
- Spotify
- Grub-customizer
- Virtualbox
- Visual Code
- make
- gcc
- xclip
- git
- software-properties-common
- fonts-powerline
- Oh My Zsh
- VIM
- Libre Office : Write & Calc
- Calibre
- Terminator
- Blueman
- Fiefox
- NeoFetch
- TREE
- Gparted
- Dolphin Emulator
- STEAM
- Android File Transfer
- Kodi
- Elementary Tweaks
- DCONF-EDITOR
- LibInput Gesture

## Elementary OS Configuration

- MAC OS THEME
- DARK MODE
- Icon MAC
- Trash Icon in DOCK
- Download in Dock
- Plank icon in launcher
- Spotify in Dock
- Default Terminal => Terminator
- Calandar => Show WEEK Numbers
- FILES => Show hidden files / Double click for open
- Shortcut system => terminal '< super >t' / home "< super >e" / www "< super >b"
- Shortcut custom => code '< super >c'
- Night Light => Enable
- Cleaner => remove-old-temp-files "true" / remove-old-trash-files "true"
- Geolocalisation => location-enabled "true"
- Install wingpanel-indicator-ayatana

## Uninstall
- epiphany-browser
- io.elementary.code