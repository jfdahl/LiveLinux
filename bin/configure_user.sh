#!/usr/bin/env bash

ln -s /tmp/bin ${HOME}/bin
cd ${HOME}/bin
cat << EOF >> ${HOME}/.bashrc

if [ -f ~/bin/env.sh ]; then
    . ~/bin/env.sh
fi

EOF


#  Set xfce timezone
xfconf-query --create --channel xfce4-panel --property /plugins/plugin-8/timezone --create --type string --set US/Central
#  Hide desktop icons
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-trash --type bool --set false
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-filesystem --type bool --set false
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-home --type bool --set false
#  Customize Thunar
xfconf-query --channel thunar --property /misc-full-path-in-title --create --type bool --set true
xfconf-query --channel thunar --property /default-view --create --type string --set ThunarDetailsView

#  Customize Terminal
mkdir -p ${HOME}/.config/xfce4/terminal
cat << EOF > ${HOME}/.config/xfce4/terminal/terminalrc
[Configuration]
CommandLoginShell=TRUE
FontName=DejaVu Sans Mono 12
EOF

#${HOME}/bin/configure_firefox.sh
