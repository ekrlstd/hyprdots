#!/bin/bash

# Simple brightness control script for Hyprland
# Usage: brightness.sh inc | dec

STEP=5% # how much to change per press

case "$1" in
inc)
  brightnessctl set +$STEP
  ;;
dec)
  brightnessctl set $STEP-
  ;;
*)
  echo "Usage: $0 {inc|dec}"
  exit 1
  ;;
esac
