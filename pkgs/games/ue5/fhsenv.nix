{ buildFHSEnv, ... }:

(buildFHSEnv {
  name = "build-ue5";

  targetPkgs = pkgs: with pkgs; [
    which
    dotnet-sdk_8
    pkg-config
    mono
    git
    python3
    vulkan-tools
    openssl
    xdg-user-dirs
  ];

  osReleaseFile = ./os-release;

  runScript = "
    cat /etc/os-release
    ./Setup.sh
    ./GenerateProjectFiles.sh
    make
  ";
})

