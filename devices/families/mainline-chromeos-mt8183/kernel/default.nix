{
  mobile-nixos
  , fetchgit
  , fetchpatch
  , ... 
}:

mobile-nixos.kernel-builder {
  version = "6.6.11";
  configfile = ./config.aarch64;

  src = fetchgit {
    url = "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git";
    rev = "22852eaf43ec64b7dc0aa72687b22237b65a88f9";
    deepClone = false;
    sha256 = "sha256-uyOi5VZ5mqoknmrBcmuvEGtpwmvIquH1gN4cWGNqdxc=";
  };

  patches = [
    # arm64: dts: mediatek: kukui: Configure scp firmware filename
    (fetchpatch {
      url = "https://github.com/samueldr/linux/commit/7b624a52f799ab01f36989146de43b0ef51f33fd.patch";
      sha256 = "sha256-gop3rD/vroudrTAbf2hWhBqrTAzRXlWEo22bB1ID0QA=";
    })
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
