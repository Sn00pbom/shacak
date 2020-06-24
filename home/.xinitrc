slstatus 2>&1 >/dev/null &
xcompmgr &
xwallpaper --zoom $HOME/Pictures/wallpapers/hollow-knight-minimalist/wp6613525-hollow-knight-minimalist-wallpapers.jpg
source $SCRIPTS/xtouchclick.sh
source $SCRIPTS/xswap_caps.sh
source $SCRIPTS/monitor.sh
xset r rate 300 40
exec dwm
