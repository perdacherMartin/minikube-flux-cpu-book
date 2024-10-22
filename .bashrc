#!/bin/bash
# curl -sS https://starship.rs/install.sh | sh

if test -f /usr/local/bin/starship ;then eval "$(starship init bash)"; fi
