#!/bin/bash

prev_session=$(tmux show-option -gq @prev_session | awk '{print $2}')
curr_session=$(tmux show-option -gq @curr_session | awk '{print $2}')

if [ "$curr_session" = "lazygit" ]; then
  tmux switch-client -t "${prev_session}"
fi

