#!/bin/sh -e

sudo apt-get install --no-install-recommends -y \
    cm-super \
    fonts-linuxlibertine \
    latexmk \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-plain-generic \
    texlive-xetex

# Install Inconsolata LGC font.

inconsolata_lgc_url='https://github.com/MihailJP/Inconsolata-LGC/releases/download/LGC-1.3.0/InconsolataLGC-1.3.0.tar.xz'
font_dir=/usr/share/fonts

mkdir -p "$font_dir"
curl -L "$inconsolata_lgc_url" | sudo tar -C "$font_dir" -xJf -

# Install pygments-style-github.

pip install pygments-style-github
