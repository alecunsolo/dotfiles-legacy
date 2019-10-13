#!/bin/bash
set -e

if [[ ! -d ~/.ssh ]]; then
    mkdir ~/.ssh
    chmod 700 ~/.ssh
fi

if [[ ! -d ~/.ssh/config.d ]]; then
    mkdir ~/.ssh/config.d
    chmod 700 ~/.ssh/config.d
fi
