# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixosDesktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";


  # Enable sound
  # 	sound.enable = true;

  # rtkit is optional but recommended
	security.rtkit.enable = true;
	services.pipewire = {
  	enable = true;
  	alsa.enable = true;
  	alsa.support32Bit = true;
  	pulse.enable = true;
  	# If you want to use JACK applications, uncomment this
  	#jack.enable = true;
	};



  # Enable th x11 windowing system
  	services.xserver.enable = true;

  # Enable the displaymanager
  	services.xserver.displayManager.sddm.enable = true;


  # Enable I3 WM
  	services.xserver.windowManager.i3 = {
		enable = true;
		extraPackages = with pkgs; [
			dmenu
			polybar
			i3lock-fancy
		];
	};


  # Configure keymap in X11
  services.xserver = {
    layout = "no";
    xkbVariant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "no";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.oddskj = {
    isNormalUser = true;
    description = "oddskj";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
	
	firefox


];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	wget
	git
	git-credential-manager
	neofetch

	alacritty
	bluez
	bluez-tools
	blueman
	btop
	calc
	discord
	feh
	fuse
	gvfs
	i3
	kbd
	kitty
	cinnamon.nemo
	networkmanager_dmenu
	ntfs3g
	pamixer
	pavucontrol
	picom
	pipewire
	prismlauncher
	pywal
	rofi
	speedtest-cli
	spotify
	steam
	steam-run
	vivaldi
	vlc
	xorg.xrandr


    
  ];


  # Enable steam
  	
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
	};

  # Fonts

  	fonts.fonts = with pkgs; [
	
		nerdfonts
		fantasque-sans-mono
		noto-fonts-cjk-sans
		borg-sans-mono
		terminus_font
		material-icons
		siji
		open-sans

	];
	

  # Enable opengl
	hardware.opengl.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
    services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
