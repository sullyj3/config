set -gx PATH $PATH '/home/james/.local/bin'
#zoxide init fish | source
# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/james/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/james/.ghcup/bin $PATH
