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
    sha256 = "sha256-r+LlpmG7iG12JoTr6nFgfR7oy53RACedKBC6INlnHlI=";
  };

  patches = [ ];

  isModular = true;
  isCompressed = false;
}
