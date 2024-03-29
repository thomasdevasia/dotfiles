# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'pc'

# Don't start tmux.
zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=(~/bin $path)

# Export environment variables.
export GPG_TTY=$TTY

# Source additional local files if they exist.
z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh  # source an individual file
z4h load   ohmyzsh/ohmyzsh/plugins/emoji-clock  # load a plugin

# Define key bindings.
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace     Ctrl+H
z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace

z4h bindkey undo Ctrl+/ Shift+Tab  # undo the last command line change
z4h bindkey redo Alt+/             # redo the last undone command line change

z4h bindkey z4h-cd-back    Alt+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Alt+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Alt+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Alt+Down   # cd into a child directory

function cd_code() {
	bash /home/thomasdevasia/scripts/project-terminal.sh
}
# z4h bindkey cd_code  Alt+c   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'

# Add flags to existing aliases.
# alias ls="${aliases[ls]:-ls} -A"
alias ls="exa -a --icons --group-directories-first"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# -------------------------------------------------------------------------------------------------------------------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/thomasdevasia/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/thomasdevasia/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/thomasdevasia/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/thomasdevasia/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias for project folder
alias project="cd /home/thomasdevasia/Desktop/Projects"

# pywal for terminal
# wal -nRe && clear

# alias for brightness
export PATH="$HOME/.config/sxhkd/:$PATH"

# play video in the directory
play() {
	# videoName=$(ls | fzf)
	videoName=$(exa | fzf)

	# file_type=$(file -b "$1")
	file_type=$(file -b "$videoName" | tr '[:upper:]' '[:lower:]')
	echo "$file_type"

    # Check if the file type contains "video"
	if [[ $file_type =~ mp4||video||matroska ]]; then
		echo "Playing $videoName"
		vlc "$videoName" &
	else
		echo "The file you selected is not a video file."
	fi
}

#print absolute path
papath() {
    # Check if a file argument is provided
    if [ -z "$1" ]; then
  		echo "Please provide a file as an argument."
	    return 1
	fi
    # Get the absolute path of the file
	absolute_path=$(realpath "$1")
	# Print the absolute path
	echo "Absolute path: $absolute_path"
}

# for connecting to my monitor
connectmonitor(){
	# xrandr --output HDMI-1-0 --mode 3840x2160
	# xrandr --output eDP-1 --left-of HDMI-1-0
	# make the monitor primary
	# xrandr --output HDMI-1-0 --primary
	# for 4k monitor
	# xrandr --output eDP-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1-0 --primary --mode 3840x2160 --pos 1920x0 --rotate normal
	# for tv
	xrandr --output eDP --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1-0 --mode 1920x1080 --pos 0x0 --rotate normal 
	cp /home/thomasdevasia/.config/bspwm/bspwmrc.double /home/thomasdevasia/.config/bspwm/bspwmrc
	# restart bspwm
	xdotool keydown Super
	xdotool keydown Alt
	xdotool keydown Control
	xdotool key r

	xdotool keyup Super
	xdotool keyup Alt
	xdotool keyup Control
}

disconnectmonitor(){
	xrandr --output HDMI-1-0 --off
	xrandr --output eDP --primary
	
	cp /home/thomasdevasia/.config/bspwm/bspwmrc.single /home/thomasdevasia/.config/bspwm/bspwmrc
	# restart bspwm
	xdotool keydown Super
	xdotool keydown Alt
	xdotool keydown Control
	xdotool key r

	xdotool keyup Super
	xdotool keyup Alt
	xdotool keyup Control

}

alias connect="connectmonitor"
alias disconnect="disconnectmonitor"

#alias for code
# alias code="code-insiders --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias code="code-insiders"

alias lock="betterlockscreen -l blur"

alias usb="cd /run/media/thomasdevasia"
alias mount-list="lsblk -l -p -o NAME,TYPE,FSTYPE,UUID,SIZE,LABEL,MOUNTPOINT"

# alias for obsidian directory
alias obsidian="cd /home/thomasdevasia/Documents/Obsidian"

# function to run update on dnf snap and flatpak
update(){
	sudo dnf update --refresh
	sudo snap refresh
	flatpak update
}
# aliasd for update
alias up="update"

# distrobox alias to connect to different distros
alias darcht="distrobox-enter arch-test"
alias darch="distrobox-enter arch-stable"

# elastic search password
# export ELASTIC_PASSWORD="WDKrBjpTA=H0PuBPucrQ"	
export WLR_NO_HARDWARE_CURSORS=1

export PATH=$PATH:$HOME/go/bin

# export PATH=$PATH:$HOME/packages/swww/target/release
# export PATH=$PATH:$HOME/packages/swww/target/release/swww-daemon

# backup script
alias backup="bash /home/thomasdevasia/Desktop/Projects/dotfiles/backup.sh"

function cpwd_to_clipboard() {
  echo -n $(pwd) | wl-copy
}

alias cpwd=cpwd_to_clipboard 

alias cc="source /home/thomasdevasia/scripts/project-terminal.sh"