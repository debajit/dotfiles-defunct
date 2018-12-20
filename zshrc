#
# Executes commands at the start of an interactive zsh session.
#
# Authors:
#   Debajit Adhikary <debajit@debajit.com>
#

# Sources the given dotfile from the home directory, if the dotfile
# exists.
function source_file() {
    filename="$HOME/${1}"
    [[ -f ${filename} ]] && source ${filename}
}

source_file ".zshrc.local"      # Local config (e.g. workplace-specific)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Prompt
# prompt debajit
prompt twofirewatch

# Set aliases last so that we can override them correctly
source_file ".aliases"          # Global aliases
source_file ".aliases.local"    # Local aliases
source_file ".paths"            # Global path settings
source_file ".paths.local"      # Global path settings
source_file ".env_vars"         # Environment variables
source_file ".env_vars.local"   # Environment variables
source_file ".env_vars.secret"  # Secret environment variables

source_file ".fzf.zsh"                          # Setup fzf
source_file ".nix-profile/etc/profile.d/nix.sh" # Setup nix

# # Added by Nix installer
# if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
#   . ~/.nix-profile/etc/profile.d/nix.sh
# fi
