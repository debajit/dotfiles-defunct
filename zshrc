#
# Executes commands at the start of an interactive zsh session.
#
# Authors:
#   Debajit Adhikary <debajit@debajit.com>
#

# Sources the given file, if it exists.
function source_file() {
    filename="${1}"
    [[ -f ${filename} ]] && source "${filename}"
}

# Sources the given dotfile from the home directory, if the dotfile exists.
function source_dotfile() {
    filename="$HOME/${1}"
    source_file "${filename}"
}

source_dotfile ".zshrc.local"      # Local config (e.g. workplace-specific)
source_file "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" # Source Prezto

# prompt debajit
prompt twofirewatch

source_dotfile ".aliases"          # Global aliases, overridable locally
source_dotfile ".aliases.local"    # Local aliases
source_dotfile ".paths"            # Global path settings
source_dotfile ".paths.local"      # Global path settings
source_dotfile ".env_vars"         # Environment variables
source_dotfile ".env_vars.local"   # Environment variables
source_dotfile ".env_vars.secret"  # Secret environment variables

source_dotfile ".fzf.zsh"                          # Setup fzf
source_dotfile ".nix-profile/etc/profile.d/nix.sh" # Setup nix
