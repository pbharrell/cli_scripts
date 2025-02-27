#!/bin/bash

if [[ $(tmux display-message -p "#S") != "popup" ]]; then
  tmux set-option -gq @prev_session $(tmux show-option -gq @curr_session | awk '{print $2}')
  tmux set-option -gq @curr_session $(tmux display-message -p "#S")
fi
