#! /bin/bash

sudo apt install -y dconf-tools
dconf-editor --I-understand-that-changing-options-can-break-applications org.gnome.desktop.interface font-name
dconf-editor --I-understand-that-changing-options-can-break-applications org.gnome.desktop.interface document-font-name
dconf-editor --I-understand-that-changing-options-can-break-applications org.gnome.desktop.interface monospace-font-name
