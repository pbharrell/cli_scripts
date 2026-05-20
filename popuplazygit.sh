#!/bin/bash
current_session="$(tmux display-message -p '#{session_name}')"
if [ "$current_session" = "popup" ];then 
    echo "Can't open lazygit in popup!"
    exit
elif [ "$current_session" = "copilot" ];then 
    echo "Can't open lazygit in copilot!"
    exit
elif [ "$current_session" = "lazygit" ];then
    tmux switch -l
    exit
fi
 
tmux switch -t lazygit &>/dev/null
if [[ "$?" == "0" ]]; then
    exit
fi

tmux new -d -s lazygit -c '#{pane_current_path}' 'lazygit'
tmux set-option -t lazygit status off
tmux set-option -t lazygit detach-on-destroy off
tmux switch -t lazygit
