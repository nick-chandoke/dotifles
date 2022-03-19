pkgs: with pkgs; [

openssl

## hw
# usbutils pciutils #lspci
# hwinfo #strictly better than lshw?
# brasero

# dmidecode #what is? sounds interesting.

## network tools, services, & utilities
wget curl wpa_supplicant wavemon traceroute macchanger nettools netcat ngrep nmap
# connect #make net connections via SOCKS and https proxy
# badvpn #vpn- and network-related tools
# cjdns #"encrypted networking for regular people"
# gnome3.gnome-nettool #collection of net tools
# dsniff #net auditing & pentesting
# ethtool #utility for controlling net drivers & hw
# #flent #"the FLExible network tester" #Failed to build: AssertionError: 'net.ipv4.tcp_autocorking' not found in {}. Looks like a python error.
# #inetutils #looks like it's already installed in nixos
# iproute iputils
# kismet #wireless net sniffer
# libdnet #"simplified, portable iface to many low-level net routines"
# netsniff-ng #"swiss army knife for daily Linux network plumbing"
# #what's openconnect? There's a package for OpenConnect "extended to support Palo Alto's Networks' GlobalProtcect VPN" (openconnect_pa)
# #what's WireGuard?
# toxiproxy #proxy which simulates various network difficiencies
# wireshark-gtk
# proxytunnel #bind stdin and stdout to a server via an HTTPS proxy

## monitors, stats, and analysis
# jnettop
# iptraf #see also iptraf-ng, a fork of iptraf
# bro #monitor for vulnerable or malicious software
# #cytoscape: for "complex networks" and "visualization"
# bmon #bandwidth monitor. see too bwm_ng 
# iftop #display bandwidth for a given device
# dnstop #libpcap program that displays DNS traffic
# mtr #monitor. traceroute + ping. monitors for overloaded links [connections]
# #netalyzr #no manpage, no -h or --help flags. no output; just hangs, for any arguments.
# netperf #benchmark nets
# #nuttcp #performance & measurement. Somehow failed to build nixos config with this.
# nload #ncurses. measures amount of traffic
# #note that network manager has OpenConnect and OpenVPN plugins (see the nixos package list; there are multiple packages for each)
# p0f #passive net recon & fingerprinting tool
# #packetbeat7 #ES7 beat about packets ; there're packetbeat5 for ES5, and packetbeat for ES6, too.
# riemann #no idea wtf it's supposed to do
# skydive #wtf is it?
# snort #intrusion prevention & detection (IDS/IPS)
# snscrape #"social network service scraper" in Python...?
# ssldump #TLS analyzer
# tcpdump #sniffer
# vnstat #generate reports in many formats, from data recorded by *NIX OSes themselves

## interesting
# tcpreplay #edit and replay
# thc-hydra #logon cracker for many different services
# iodine #tunnel IPv4 data through DNS servers
# testssl #get a server's SSL/TLS capabilities

## network-based userland programs
# torchat
# netrw #simple tool for transporting data via network
# lftp #ftp-like programs
# mldonkey #client for many p2p nets, w/multiple frontends
# driftnet #watches network traffic, "picking-out JPEG and GIF images for display"
# enet #"simple & robust net com layer atop UDP"
# freenet #decentralized & cencorship-free network! :D
# ndn-cxx
# zeronet #decentralized net built on blockchain

## network managers
# connman connman-ncurses
# iwd

## admin tools or low-level
lsof nix-index
(import ./kmonad.nix pkgs) # see also nixpkg keyfezz, which manipulates keyboard drivers' keycode translation tables

## utilities
file
rlwrap
# fcitx-configtool
youtube-dl
htop
p7zip
ttyplot
ncdu # rather than baobab
obexfs obexftp openobex
pamix #ponymix
pavucontrol
# minio minio-client #An S3-compatible replacement for ls, cp, mkdir, diff and rsync commands for filesystems and object storage
# consider using in conjunction with [sphinxsearch](http://sphinxsearch.com/about/sphinx/)
# wpgtk #executable name is wpg
# neofetch

## i18n
# anthy fcitx-engines.anthy #fcitx-engines.anthy implies fcitx

## graphics environment
# vwm wtftw ly
libnotify
et # egg timer

# sickrage-v2018.07.21-1 # video library

## binutils
patchelf binutils

## general everyday applications
lsd
kitty
tmux # just in case i do any remote work
gnupg
cool-retro-term
pwgen
# hexio
# theharvester
brightnessctl
git
maxima # cf julia + jupyter
gnuplot
gallery-dl
# noteshrink

## music creation
# fluidsynth # synth
# renoise # TODO: check-out
# wildmidi # convert MIDI to sampled audio. it's a library, not an application.
# timidity # convert MIDI to sampled audio. application, not a library.
# vmpk # piece of shit
# jack2
# qjackctl # qt app to control jack daemon. piece of shit.

## catamorphic (map/filter)
asciidoctor
ffmpeg # TODO: cf caudec
xidel # html catamorphisms
obs-studio
asciinema
# NOTE: if i can convert HTML to JSON (possibly involving https://github.com/martinblech/xmltodict, in the nix repo,) then these json tools are extremely powerful for scraping (as long as i can get the correct html, possibly being computed by js!)
gron # grep JSON
jp   # use JMESPath to extract from JSON. written in go. https://jmespath.org/
jl   # easy JSON catamorphisms. by chris done.
# jid  # interactively dive into JSON objects. makes identifying useful jq queries tolerable. written in go.
pdfgrep graphviz graphicsmagick sourceHighlight
audacity
ripgrep # command name is rg. pt does nothing, has no help nor man nor info. haven't tried ag, nor ack. NB. nixexpr "pt" is something entirely else.

## streaming
aria uget hexchat

gimp inkscape #image
# libreoffice
# lyx # texmaker texstudio gummi #latex
massren # emv "mass rename" filepaths
# NB. audio cds cannot be used with dd b/c their logical format is not a filesystem, but instead a record-like thing.
abcde # rip audio cds. like crip, is a script (though bash instead of perl) that seems to use other _actual_ programs
sqlite
# tikzit #mathematical graphs
# #cinelerra non-free #video
# aegisub #subtitles
# ipe #"figures"?
# ised #numeric sequences
# shotcut pitivi openshot-qt avidemux #video
# sops #encrypted data
# eagle (non-free) #pcb & schematics

# TODO: re-organize this file and prune undesirable packages, but mark them (in a local sqlite db) as being unwanted. searchpkgs shall reflect this by displaying those programs in red text.
## truly interactive dev envs: the next generation of editor
# lighttable
micro # smol tui editor. made to obviate nano. written in go, scriptable in many languages including pony & lua.
fzf
kakoune
kak-lsp
moe # 8-bit clean editor (gnu)
ht # editor of text, binary, and particularly, executables
pev # toolkit (many programs) for working with portable executables (viz windows exe, dll)
lief # wtf is this?
#processing #does not install. Says to set oraclejdk.accept_license = true;, but that attribute does not exist

## hex editors
bbe # binary block stream editing
dhex #curses. features diff mode and handy hex calculator.
     #has some rendering trouble, at least on kitty.
     #curses style. sensible keybinds. allows custom binds, too. has statusbar with common keybinds for easy reference.
     #search by hex or string. Use arrow keys to select UI elements in curses windows. Very easy.
     #search is a little odd: found search term always occupies first byte position.
     #better than hexcurse, which is better than hexedit
okteta #gui
hecate #curses. very cool, novel ui, showing chars adjacent to each their corresponding hex value. no man nor --help, but simple in-editor help via pressing '?'
tweak # TODO: cf ht. tweak is lazy. is ht?
watchexec # execute commands upon file changes

## hex dumpers
hexd xxd

## browsers / viewers
vlc mpd flac
# googleearth # currently 404 on dl
ympd # simple C mpd client
vimpc zathura # zathura is for pdfs, possibly in addition to other formats
# gnash # flash player
mcomix3 # TODO: make or find reliable, efficient, minimalist alternative
mpv     # mpv was forked from mplayer long ago to rebase onto ffmpeg, clean code, reduce, modernize, and become scriptable (via lua among others.) wayland-native.
wallutils # for both X and wayland
# haxor-news
newsboat
gtk2fontsel gucharmap
unrar
t

## internet
# tor-browser-bundle-bin # heap of shit that'll probably never work
firefox
luakit
nyxt
w3m
# these may be libs, not exes, though that contrasts the nixos docs: dleyna-server python27Packages.weboob python27Packages.twill perl528Packages.HTMLClean

## diffs
# diff-pdf diffpdf #for pdfs
# diffuse diffoscope
# perceptualdiff #for images
# wdiff #by words
#nixos.python27Packages.htmltreediff

## binary diffs
# bsdiff vbindiff

## filesystem diffs
# xxdiff

## emulators
mgba

# proglangs, in order of preference
picolisp
factor-lang
racket
go
(python3.withPackages (pypkgs: with pypkgs; [ mediafile ]))
(haskellPackages.ghcWithPackages (hspkgs: with hspkgs; [lens optics]))
gcc gnumake
lua # for luakit. fennel's a single-file library in ~/programming/
cargo # needed for kakoune to support language server protocol, since that's a rust package
# clojure leiningen cask
ghc
nodejs
# crex # regex checker/tester
# d-feet # gui d-bus debugger/testing control

## servers
#shairplay #apple Airplay and raop protocol server
#sipswitch #secure P2P VoIP server that uses the SIP protocol
#sks #easily-deployable & decentralized OpenPGP keyserver
#dovecot #open-source secure IMAP & POP3

## fuzzers
afl # genetic algorithm...and "instrumentation?" ok.
agrep # fuzzy match grep
broot # interactive tree view, fuzzy search, balanced BFS descent and customizable commands...?
fzy   # like fzf but better
radamsa # dunno how to use, but apparently it's proven useful to find many bugs in many useful programs

## analyzers
# crex
  
## others
# caddy # HTTP/2 web server with "automatic" HTTPS
#websocketd #redirect stdin/out to WS
pinentry # needed for gpg to decrypt, at least in a graphical environment
pastel # color tool

## iphone stuff
usbmuxd # run (as sudo?) before connecting iphone via usb
ifuse   # then run this after iphone's trusted the computer
libimobiledevice
]
