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

  patches = [ 
    # CHROMIUM: Revert "serial: 8250_mtk: Fix UART_EFR register address"
    # https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3670640
    (fetchpatch {
      url = "https://github.com/torvalds/linux/commit/4cec85ca5a098fca3d49bda9976bccaca16a8876.patch";
      sha256 = "sha256-V5d1OSJro82LIWrlJ74m5xxF26dtEe7HZmoFgUX/HBc=";
    })
  ];

  isModular = true;
  isCompressed = false;
}
