{
  mobile-nixos
  , fetchurl
  , fetchpatch
  , ... 
}:

mobile-nixos.kernel-builder {
  version = "6.6.11";
  configfile = ./config.aarch64;

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v6.x/linux-6.6.11.tar.xz";
    sha256 = "0lhyczcj1fhh52fjf06ikp5yh7kxc1qymsw44rv6v25vc6kfbqmg";
  };

  patches = [ ];

  isModular = true;
  isCompressed = false;
}
