#!/bin/bash
if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ];then 
    return
elif [ "$(tmux display-message -p -F "#{session_name}")" = "lazygit" ];then
    tmux switch -l
else
    tmux switch -t lazygit || (tmux new -d -s lazygit -c '#{pane_current_path}' 'tmux set-option status off; lazygit' && tmux switch -t lazygit)
    tmux set-option -t lazygit detach-on-destroy off
fi
