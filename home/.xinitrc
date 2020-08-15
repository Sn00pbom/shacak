slstatus 2>&1 >/dev/null &
xcompmgr &
unclutter &
xwallpaper --zoom $HOME/Pictures/wallpapers/wp4765968-density-wallpapers.jpg
xwallpaper --zoom $HOME/Pictures/wallpapers/pixel/1527529089394.png
xautolock -time 10 -locker slock 2>&1 >/dev/null &
mon
xset r rate 300 40
source $SCRIPTS/xtouchclick.sh
exec dwm
