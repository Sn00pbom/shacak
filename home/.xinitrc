export XIM=nabi
export XIM_ARGS=
export XIM_PROGRAM="nabi"
export XMODIFIERS="@im=nabi"
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
export _JAVA_AWT_WM_NONREPARENTING=1

slstatus 2>&1 >/dev/null &
xcompmgr &
dunst &
unclutter &
flameshot &
nm-applet &
pa-applet &
blueman-applet &
xwallpaper --zoom "$HOME/Pictures/chromecast-papes/00674.jpg"
xautolock -time 5 -locker slock 2>&1 >/dev/null &
mon
xset r rate 300 40
xbindkeys
source $SCRIPTS/xtouchclick.sh
exec dbus-launch dwm
