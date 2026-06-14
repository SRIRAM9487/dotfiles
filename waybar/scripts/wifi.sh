#!/usr/bin/env bash

kitty -e bash -c 'nmcli device wifi rescan && nmcli device wifi list; exec zsh'
