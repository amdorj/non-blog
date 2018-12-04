#!/bin/bash

# .bash_aliases
# https://raw.githubusercontent.com/anthonykava/non-blog/master/file/.bash_aliases
# https://github.com/anthonykava/non-blog
# @anthonykava 2018-12-04

# Util / Misc
alias openssldump='openssl x509 -noout -text -in'                           # Dump .pem for human-readability
alias dis='disown'                                                          # Disown backgrounded process
alias c='clear'                                                             # yeah, CTRL+L, whatever
alias d='du -hslc * | sort -h'                                              # human-sorted size of files/dirs

# Applications
alias s='ssh'
alias incognito='chromium-browser --incognito'                              # quick launch incognito Chromium
alias incog='incognito'                                                     # shortened
alias 7zenc='7z a -t7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on -mhe=on -p'   # Create encrypted 7-zip archive
alias xnv='xnview . >/dev/null 2>&1'                                        # Launch xnView for current dir
alias httpServer='python -m SimpleHTTPServer'                               # Start the python SimpleHTTPServer
alias httpServer3='python3 -m http.server'                                  # python3 equiv for SimpleHTTPServer

# GUI
alias copy='xsel -ib'                                                       # copy STDIN to clipboard
alias open='xdg-open'                                                       # open in X Windows

# Directory ops
alias ..='cd ..'                                                            # Parent dir (most common)
alias .-='cd -'                                                             # Last dir (most common)
alias cd..='cd ..'                                                          # Parent dir
alias cd.='cd ..'                                                           # Parent dir
alias _='cd -'                                                              # Last dir
alias cd-='cd -'                                                            # Last dir
alias md='mkdir'                                                            # In case I'm lost
alias rd='rmdir'                                                            # In case I'm lost

# Copy/move/remove
alias cp='cp -iv'                                                           # Safety third
alias mv='mv -iv'                                                           # Safety third
alias rm='rm -iv'                                                           # Safety third

# I/O
alias dd='dd status=progress'                                               # Always like status=progress
alias unbuf='stdbuf -o 0'                                                   # Try to prevent buffering
alias tolower="tr '[:upper:]' '[:lower:]'"                                  # Transform to lowercase
alias toupper="tr '[:lower:]' '[:upper:]'"                                  # Transform to uppercase

# Use a favourite User-Agent for wget
alias wgetmal='wget -v -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36"'

# Presets for ewfacquire to acquire E01s
alias ewf='ewfacquire -b 32768 -c best -d sha1 -d sha256 -e "Your Name Here" -g 1 -l log.ewfacquire -M physical -v'
alias ewfsudo='sudo ewfacquire -b 32768 -c best -d sha1 -d sha256 -e "Your Name Here" -g 1 -l log.ewfacquire -M physical -v'
