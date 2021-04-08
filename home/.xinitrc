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
numlockx &
xwallpaper --zoom $HOME/Pictures/wallpapers/1614304221426.png
xautolock -time 5 -locker slock 2>&1 >/dev/null &
xset r rate 300 40
xbindkeys
exec dbus-launch dwm
