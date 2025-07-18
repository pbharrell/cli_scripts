#!/bin/bash

width=$(tput cols)

if [ "$width" -ge 120 ]; then
  display="side-by-side-show-both"
else
  display="inline"
fi

exec difft --color=always --display="$display" "$@"
