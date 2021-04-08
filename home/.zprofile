# Define environment variables here for login shells
export PATH=$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export SCRIPTS=$HOME/.scripts

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"
export TERM="tmux-256color"

# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CONFIG_HOME="$HOME/.config"

fortune | cowsay

if [[ -z $DISPALY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi
