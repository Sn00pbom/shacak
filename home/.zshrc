# set up aliases
alias vim=nvim
alias comrade="nvim --cmd 'let comradesession=1'"
alias vimdiff="nvim -d"
alias mirrors="sudo reflector --verbose --protocol https --latest 200 --sort rate --save /etc/pacman.d/mirrorlist"
alias open="xdg-open"
alias lst="ls -lht"
alias lf="lfpreview"
alias tab="tabbed -k -c -r 2 st -w ''"
alias oni="Oni2"
alias svim="sudo nvim"
alias gs="git status"
alias glog="git log --graph"
alias youtube-dl-mp3="youtube-dl --extract-audio --audio-format mp3"
alias lswebcam="v4l2-ctl --list-devices"
alias java17="/usr/lib/jvm/java-17-openjdk/bin/java"

pdftab() {
    if [ -z $TABBED ]
    then
        export TABBED=$(tabbed -t "#b85ae8" -k -c -d)
        st -w $TABBED & disown
        IS_PARENT=1
    fi

    for f in $@
    do
        zathura "$f" -e $TABBED & disown
    done

    if [ $IS_PARENT ]
    then
        export TABBED=""
    fi
}


chanmv() {
    hashmv $(ls | grep -E "^[0-9]+\..+$")
}

mpv-remote() {
    # start mpv remote control server and run mpv on file
    source ~/envs/mpvremote/bin/activate
    mpv-remote-app wewlad &
    mpv --input-ipc-server=/tmp/mpvsocket $@
    kill %mpv-remote-app
    deactivate
}

mon() {
    xrandr --output HDMI1 --auto
    xrandr --output eDP1 --off
    # set audio output to HDMI
    pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo
}

unmon() {
    xrandr --output HDMI1 --off
    xrandr --output eDP1 --auto
    # set audio output to analog
    pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo
}

movie() {
    pkill -f slock
    xset s off -dpms
}

# Path to your oh-my-zsh installation.
export ZSH="/home/zach/.oh-my-zsh"

ZSH_THEME="lambda-blazinggit/lambda-blazinggit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# source "$HOME/go/src/github.com/sachaos/todoist/todoist_functions_fzf.sh"

# Set fzf installation directory path
export FZF_BASE=/usr/bin/fzf
# export FZF_COMPLETION_OPTS='--border --info=inline --preview "git show --color=always {} | head -"'

# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fast-syntax-highlighting vi-mode fzf gitstatus)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source /usr/share/nvm/init-nvm.sh

