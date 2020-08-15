slstatus 2>&1 >/dev/null &
xcompmgr &
unclutter &
xwallpaper --zoom $HOME/Pictures/wallpapers/wp4765968-density-wallpapers.jpg
xwallpaper --zoom $HOME/Pictures/wallpapers/pixel/1527529089394.png
xautolock -time 5 -locker slock 2>&1 >/dev/null &
mon
xset r rate 300 40
xbindkeys
source $SCRIPTS/xtouchclick.sh
exec dwm
