# nix-buttermanager-development-environment
This is a Nix flake which enables a Python3 and a QT Development environment ready to use. I use it to develop [ButterManager](https://github.com/egara/buttermanager) in a NixOS system.

# How can I enter the environment?

Nix Flakes must be supported. Once they are activated:

    nix develop .#default

# How can I exit the environment?

Just type

    exit

# How can I update the flake?

Type

    nix flake update

# Tools installed and ready to use:

- Python 3
- PyCharm Community Edition
- QT Tools such as Designer for designing UI

And more. Check out **flake.nix** for the full list of packages installed.