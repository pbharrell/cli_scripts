#!/bin/bash
width=${2:-90%}
height=${2:-90%}

if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ];then
    tmux detach-client
elif [ "$(tmux display-message -p -F "#{session_name}")" = "lazygit" ];then
    tmux switch -l
else
    tmux popup -d '#{pane_current_path}' -xC -yC -w$width -h$height -E "tmux attach -t popup || tmux new -s popup"
fi
