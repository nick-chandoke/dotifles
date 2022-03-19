### introduce nix environment (load stuff first)

{ config, pkgs, ... }: { # i'm guessing that pkgs is inferred from nix-channel(1). see configuration.nix(5)
imports = [./hardware-configuration.nix];

### bootloader & init

boot = {
    # needed for streaming wayland (wl-roots) outputs via wf-recorder
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    # Use the systemd-boot EFI boot loader.
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };
};

### general options

networking = {
  hostName = "nixy";
  wireless = {
    enable = true; # wpa_supplicant
  };
  #extraHosts = ""; #nixos' version of /etc/hosts
  wireless.interfaces = ["wlp64s0"];
  firewall = { allowedTCPPorts = [ 2000 # netcp
                                 ];};
}; 

i18n.defaultLocale = "en_US.UTF-8";

console = {
  font = "Hurmit Nerd Font";
  keyMap = "dvorak";
};

time.timeZone = "America/Chicago"; # see <https://en.wikipedia.org/wiki/List_of_tz_database_time_zones>

sound.enable = true;
hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
};

hardware.bluetooth = {
   enable = true;
   #extraConfig = ''
   #  [General]
   #  Enable=Source,Sink,Media,Socket,Gateway
   #  '';
};

xdg.portal.enable = true; # required for flatpak, which is practically required for telegram, since telegram requires the most recent version to function AT ALL

services = {
    tor = {
      enable = true;
      client.enable = true; # SOCKS service on 9063. new circuit every 10 min.
    };
    # xfs.enable = true;
    udev.extraRules =
    ''
    # KMonad user access to /dev/uinput
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';
    openssh.enable = true;
    printing.enable = true; # enable CUPS
    logind.lidSwitch = "ignore";
    flatpak.enable = true;
};

virtualisation = {
    # anbox.enable = true; # android virtualization. currently broken.
    virtualbox.host.enable = true; # enable virtualbox
};

users = {
    # for interactive use. applies to VTs, which shouldn't be problematic,
    # because scripts should use #!/usr/bin/env bash or #!/bin/sh anyway
    defaultUserShell = pkgs.nushell;
    groups = {uinput = {};};
    extraGroups.vboxusers.members = [ "nic" ];
    # yes, the full form is users.users.<user>
    users.nic = {
        isNormalUser = true;
        extraGroups = [ "wheel" "fuse" "video" "input" "uinput" ]; # video is for brightnessctl. [u]input is for kmonad.
      };
};

# determines the nixos release with which your system is to be
# compatible. avoids breaking some software. change only
# after the nixos release notes say you should.
system.stateVersion = "21.11";

fileSystems = {
  "/mnt/exthdd" =
    { device = "/dev/disk/by-uuid/f8fdaecb-7927-4faa-9f9c-2e3cb2330188";
      fsType = "ext4";
      options = [ "nofail" ];
    };
};

programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
security.sudo.extraConfig = "%wheel ALL=(ALL) NOPASSWD:ALL";

# how does wayland consider fonts?
fonts = {
  enableDefaultFonts = true;
  fontDir.enable = true;
  fonts = with pkgs; [
    hanazono rounded-mgenplus # jp fonts

    # programming fonts
    hasklig fira-code inconsolata-lgc # lgc variant supports greek & cyrllic also
    ankacoder hermit nerdfonts
    # corefonts #microsoft's core fonts
  ];
  fontconfig = {
    enable = true;
    defaultFonts = { #used when current/default font cannot display glyphs
                     #TODO: does this override ~/.config/fontconfig/fonts.conf?
      monospace = [
          "Hasklig"
          "Fira Code"
          "monospace"
      ];
      sansSerif = [
          "HanaMinA"
          "DejaVu Sans"
      ];
      serif = [
          "HanaMinA"
          "DejaVu Serif"
      ];
    };
  };
};

location = {
    latitude = 32.984515;
    longitude = -96.674515;
};

### wayland options

programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
        wev         # like xev but for wayland
        # see https://wiki.archlinux.org/title/Screen_capture#Wayland
        grim        # screen capture (image)
        slurp       # select a region to capture
        wf-recorder # screen capture (video)
        v4l-utils
        swayidle
        swaybg
        wl-clipboard
        waybar
        gammastep   # like redshift. only for wayland compositors that support wlroots
        wofi        # select string from list with autocompletion
        dunst       # notification daemon
        # vimiv     # marked as broken
    ];
};

# TODO: are input methods X11-specific, or also wayland?
i18n.inputMethod = {
  enabled = "fcitx";
  fcitx.engines = with pkgs.fcitx-engines; [ mozc anthy ];
};

# i'm no longer using any programs from koi. code left here as template for including other additional channels.
# environment.systemPackages = (import ./pkgs.nix) pkgs (import <koi> {}); # after # nix-channel --add https://nixos.org/channels/nixos-19.03 koi; nix-channel --update
environment = {
    # non-interactive use. at /bin/sh
    binsh = "${pkgs.dash}/bin/dash";
    systemPackages = (import ./pkgs.nix pkgs); # the result of import ./pkgs.nix is a unary function; pkgs is its argument.
};

nixpkgs.config = {
  permittedInsecurePackages = [ "ffmpeg-2.8.17" ]; # TODO: check-out gstreamer, too.
  allowUnfree = true;
};

### SUGGESTED OPTIONS THAT I DON'T CURRENTLY USE

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
}
