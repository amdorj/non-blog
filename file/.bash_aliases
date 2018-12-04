#!/bin/bash

# .bash_aliases
# https://raw.githubusercontent.com/anthonykava/non-blog/master/file/.bash_aliases
# https://github.com/anthonykava/non-blog
# @anthonykava 2018-12-04

# Util / Misc
alias openssldump='openssl x509 -noout -text -in'                           # dump .pem for human-readability
alias dis='disown'                                                          # disown backgrounded process
alias c='clear'                                                             # yeah, CTRL+L, whatever
alias d='du -hslc * | sort -h'                                              # human-sorted size of files/dirs
qr() { r2 -qc "w $@;pqz" - | sed 's/ /█/g' | sed 's/\#/ /g'; }              # generate a QR code (function)
alias qrcode='qr'                                                           # alias for qr()

# applications
alias s='ssh'                                                               # nickname for ssh
alias incognito='chromium-browser --incognito'                              # quick launch incognito Chromium
alias incog='incognito'                                                     # shortened
alias 7zenc='7z a -t7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on -mhe=on -p'   # create encrypted 7-zip archive
alias xnv='xnview . >/dev/null 2>&1'                                        # launch xnView for current dir
alias httpServer='python -m SimpleHTTPServer'                               # start the python SimpleHTTPServer
alias httpServer3='python3 -m http.server'                                  # python3 equiv for SimpleHTTPServer
alias gitpush='git -u origin master'                                        # lazy git push to master

# GUI
alias copy='xsel -i'                                                        # copy STDIN to primary selection
alias paste='xsel -o'                                                       # paste primary selection to STDOUT
alias copyclip='xsel -bi'                                                   # copy STDIN to clipboard
alias pasteclip='xsel -bo'                                                  # paste clipboard to STDOUT
alias open='xdg-open'                                                       # open in X Windows

# directory ops
alias ..='cd ..'                                                            # parent dir (most common)
alias .-='cd -'                                                             # last dir   (most common)
alias cd..='cd ..'                                                          # parent dir (oldie)
alias cd.='cd ..'                                                           # parent dir (oldie)
alias _='cd -'                                                              # last dir   (oldie)
alias cd-='cd -'                                                            # last dir   (oldie)
alias md='mkdir'                                                            # in case I'm lost
alias rd='rmdir'                                                            # in case I'm lost

# copy/move/remove
alias cp='cp -iv'                                                           # safety third
alias mv='mv -iv'                                                           # safety third
alias rm='rm -iv'                                                           # safety third

# I/O
alias dd='dd status=progress'                                               # always like status=progress
alias unbuf='stdbuf -o 0'                                                   # try to prevent buffering
alias tolower="tr '[:upper:]' '[:lower:]'"                                  # transform to lowercase
alias toupper="tr '[:lower:]' '[:upper:]'"                                  # transform to uppercase

# use a favourite User-Agent for wget, e.g., for malware retrieval
alias wgetmal='wget -v -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36"'

# presets for ewfacquire to acquire E01s
alias ewf='ewfacquire -b 32768 -c best -d sha1 -d sha256 -e "Your Name Here" -g 1 -l log.ewfacquire -M physical -v'
alias ewfsudo='sudo ewfacquire -b 32768 -c best -d sha1 -d sha256 -e "Your Name Here" -g 1 -l log.ewfacquire -M physical -v'
