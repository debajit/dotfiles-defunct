task :default => [:updateconfig]


# Shell Commands
UPDATE_CONFIG_SHELL_COMMAND = "cp -f gitconfig ~/.gitconfig"


# ANSI color codes
# Reference: http://en.wikipedia.org/wiki/ANSI_escape_code#Colors 
RED = 1
GREEN = 2
CYAN = 6


# Colors for actions
SUCCESS_TEXT_COLOR = GREEN
FAILURE_TEXT_COLOR = RED
INFO_TEXT_COLOR = CYAN


# ANSI color escape sequences
BEGIN_TEXT_COLOR_PREFIX = "\x1b["
BEGIN_TEXT_COLOR_SUFFIX = ";1m"
END_TEXT_COLOR = "\x1b[0m"


def colorizeString (textcolor, stringToColorize)
  return BEGIN_TEXT_COLOR_PREFIX + (30 + textcolor).to_s + BEGIN_TEXT_COLOR_SUFFIX + stringToColorize + END_TEXT_COLOR
end


def successString (message)
  return colorizeString(SUCCESS_TEXT_COLOR, message)
end


def failureString (message)
  return colorizeString(FAILURE_TEXT_COLOR, message)
end


def infoString (message)
  return colorizeString(INFO_TEXT_COLOR, message)
end


desc "Updates .gitconfig in your home directory"
task :updateconfig do
  puts infoString("Updating .gitconfig ...")
  status = system(UPDATE_CONFIG_SHELL_COMMAND)
  puts status ?  successString("[OK]  Updated ~/.gitconfig successfully") : failureString("[FAILED]  Could not update ~/.gitconfig")
end

