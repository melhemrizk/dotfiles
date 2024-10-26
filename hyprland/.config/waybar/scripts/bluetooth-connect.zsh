#!/usr/bin/env zsh

# Connect to the Soundcore Space One device
MAC_ADDRESS=$(bluetoothctl devices | 
  grep "soundcore Space One" | 
  grep -oE '([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}' | 
  tr -d ' '
)

bluetoothctl connect "$MAC_ADDRESS"
