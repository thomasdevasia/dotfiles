# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

#starship
eval "$(starship init bash)"

#alias for code
# alias code="code-insiders --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias code="code-insiders"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/thomasdevasia/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

# alias for project folder
alias project="cd /home/thomasdevasia/Desktop/Projects"

# pywal for terminal
wal -nRe && clear

# alias for brightness
export PATH="$HOME/.config/sxhkd/:$PATH"

# play video in the directory
play() {
	videoName=$(ls | fzf)
	
	# file_type=$(file -b "$1")
	file_type=$(file -b "$videoName" | tr '[:upper:]' '[:lower:]')
	echo "$file_type"

    # Check if the file type contains "video"
    if [[ $file_type =~ mp4|video|matroska ]]; then
		vlc "$videoName"
		# echo "Playing $videoName"
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
	xrandr --output eDP-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1-0 --primary --mode 3840x2160 --pos 1920x0 --rotate normal
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
	xrandr --output eDP-1 --primary
	
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


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
