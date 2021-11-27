#!/usr/bin/env bash

# hey vi, when you get on linux, and setup tmux, add the line below to your tmux.conf for a tmux keybind for this
# bind-key -r <key> run-shell "tmux neww ~/.dotfiles/cht.sh"

languages=`echo "golang lua cpp c typescript nodejs rust" \ tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if printf $languages | grep -qs $selected; then
	tmux neww -n "$selected/$query" curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done
else
	tmux neww -n "$selected~$query" curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done
fi

