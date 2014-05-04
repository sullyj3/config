#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec /home/james/autostarts/i3.sh
#[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# nitrogen --restore &
# compton -c --config ~/.compton.conf -b
# synapse -s &
#wicd-gtk -t&
# volti -b &

#pidof mpdscribble >& /dev/null
#if [ $? -ne 0 ]; then
# mpdscribble &
#fi

#Tiling
# exec wmii
# exec spectrwm
# exec awesome
# exec echinus
# exec xmonad

#Floating
# exec startfluxbox
# exec openbox-session
# exec compiz doesnt work

#DEs
# exec gnome-session-cinnamon
# exec gnome-session
# exec startkde
# exec startxfce4

# ...or the Window Manager of your choice

