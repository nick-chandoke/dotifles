alias diff = diff --color=always
alias fluidsynth = fluidsynth -ja jack --server
alias grep = grep -E --color=always -d skip
alias pwgen = pwgen -scnyN1 10
alias rm = ^rm -i
alias whois = whois -H
alias asciidoctor = asciidoctor -bhtml5 -a source-highlighter=prettify
alias mv = ^mv -i

#Short Scripts
alias bell = mpv -s $HOME/programming/op_finished.wav
alias git-show-tracked-files = git ls-tree -r master --name-only
alias on = lsd -Ft --color=always
alias c = clear
alias rkt = racket
alias stream-desktop = wf-recorder -m v4l2 -c rawvideo -f /dev/video4 -x yuv420p -o HDMI-A-1

alias newsboat = newsboat -r

alias luarocks = luarocks --local
alias recaudio = ffmpeg -loglevel error -f pulse -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -c:a libvorbis
alias left-hand = xinput set-button-map "Kensington Slimblade Trackball" 3 2 1
alias wo = (sudo rfkill unblock wifi; sudo rfkill block bluetooth)
alias bo = (sudo rfkill block wifi; sudo rfkill unblock bluetooth)
alias by = sudo rfkill unblock bluetooth
alias wy = sudo rfkill unblock wifi
alias bn = sudo rfkill block bluetooth
# alias wn = sudo rfkill block wifi

alias copy-playlists-to-ext-disk = sudo copy-playlists-to-ext-disk -m /home/nic/music -p /home/nic/.playlists

alias stockbot-login = ssh rancher@167.99.113.138
alias mpv-no-vid = mpv --vid=no
alias tree = lsd --tree
alias crip = crip -e flac -x -E /nix/store/hw37d4kwfk21dpjzxv8is1ssfsl31wmj-system-path/bin/kak
alias rawrip = abcde -o wav -a read -kx
alias sqlite3 = rlwrap sqlite3
alias picolisp = rlwrap picolisp
alias maxima = rlwrap maxima
alias luabookmarks = rlwrap sqlite3 $HOME/.local/share/luakit/bookmarks.db
alias fennel = rlwrap fennel
