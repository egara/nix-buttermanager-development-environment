{
  description = "A Nix-flake-based python3 development environment to develop Buttermanager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self , nixpkgs ,... }: 
  let
    # system should match the system you are running on
    system = "x86_64-linux";
  in 
  {
    devShells."${system}".default = 
    let
      pkgs = import nixpkgs {
        inherit system;

        # Allow unfree packages
        config.allowUnfree = true;
      };
    in 
    pkgs.mkShell {
      # Python development environment with QT integration
      # For more information https://nixos.wiki/wiki/Qt
      packages = with pkgs; [
        python3
        jetbrains.pycharm-oss
        python312Packages.pyqt5
        python312Packages.pyyaml
        python312Packages.sip
        python312Packages.tkinter
        xorg.libxcb
        qt5.wrapQtAppsHook
        qt5.qtbase
        qt5.qttools
        qt5.qtsvg
        #qtcreator
      ];

      shellHook = ''
        echo "Entering Python 3 development environment"
        echo "To find python3 binary, type 'whereis python3' or 'which python3'"
        echo "Type 'pycharm-oss&' to open PyCharm or 'designer&' to open QT Designer to develop GUI"
        echo "If you want to exit this environment, type exit"
      '';
    };
  };
}