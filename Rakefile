#
# Installs dotfiles.
#
# For .gitconfig, the existing author name and email are preserved.
#
# USAGE:
#           rake - Install all dotfiles
#        rake -T - Show individual dotfiles that will be installed
#   rake clobber - Delete installed dotfiles
#

require 'rake/clean' # See http://devblog.avdi.org/2014/04/28/rake-part-6-clean-and-clobber/

# Sources
GITCONFIG_SOURCE = 'gitconfig'
TEXTMATE_KEYS_SOURCE = 'textmate_keybindings.dict'
DIVVY_PREFS_SOURCE = 'divvy_preferences.plist'
DIVVY_PREFS_EL_CAPITAN_SOURCE = 'divvy_preferences_el_capitan.plist'
SPECIAL_DOTFILES = [
  GITCONFIG_SOURCE, 
  TEXTMATE_KEYS_SOURCE,
  DIVVY_PREFS_SOURCE,
  DIVVY_PREFS_EL_CAPITAN_SOURCE
]
GENERAL_DOTFILES = FileList['*'].exclude('Rakefile', 'README.*', *SPECIAL_DOTFILES)

# Targets
GITCONFIG_TARGET = "#{Dir.home}/.#{GITCONFIG_SOURCE}"
TEXTMATE_KEYS_TARGET = "#{Dir.home}/Library/Application Support/TextMate/Keybindings.dict"
DIVVY_PREFS_TARGET = "#{Dir.home}/Library/Preferences/com.mizage.Divvy.plist"
DIVVY_PREFS_EL_CAPITAN_TARGET = "#{Dir.home}/Library/Preferences/com.mizage.direct.Divvy.plist"
SPECIAL_TARGETS = [
  GITCONFIG_TARGET,
  TEXTMATE_KEYS_TARGET,
  DIVVY_PREFS_TARGET,
  DIVVY_PREFS_EL_CAPITAN_TARGET
]
GENERAL_TARGETS = GENERAL_DOTFILES.pathmap("#{Dir.home}/.%f")
ALL_TARGETS = [*GENERAL_TARGETS, *SPECIAL_TARGETS]

desc 'Install all dotfiles'
task default: ALL_TARGETS
CLOBBER.concat(ALL_TARGETS)

GENERAL_DOTFILES.each_index do |i|
  desc "Install #{GENERAL_DOTFILES[i]}"
  file GENERAL_TARGETS[i] => GENERAL_DOTFILES[i] do
    cp GENERAL_DOTFILES[i], GENERAL_TARGETS[i]
  end
end

desc 'Install gitconfig'
file GITCONFIG_TARGET => GITCONFIG_SOURCE do |t|
  username = ask_user_if_blank(GitConfigurator.username, 'Git author name')
  email = ask_user_if_blank(GitConfigurator.email, 'Git author email')

  cp GITCONFIG_SOURCE, GITCONFIG_TARGET

  GitConfigurator.username = username
  GitConfigurator.email = email
end

desc 'Install TextMate keybindings'
file TEXTMATE_KEYS_TARGET => TEXTMATE_KEYS_SOURCE do |task|
  cp task.prerequisites.first, task.name
end

desc 'Install Divvy preferences'
file DIVVY_PREFS_TARGET => DIVVY_PREFS_SOURCE do |task|
  cp task.prerequisites.first, task.name
end

desc 'Install Divvy preferences on El Capitan'
file DIVVY_PREFS_EL_CAPITAN_TARGET => DIVVY_PREFS_EL_CAPITAN_SOURCE do |task|
  cp task.prerequisites.first, task.name
end

#------------------------------------
# Utility classes and methods
#------------------------------------

#
# Role that provides facilities to configure git settings
#
module GitConfigurator

  USERNAME = 'user.name'
  EMAIL = 'user.email'

module_function

  def username
    read_git_config(USERNAME)
  end

  def username=(new_username)
    write_git_config(USERNAME, new_username)
  end

  def email
    read_git_config(EMAIL)
  end

  def email=(new_email)
    write_git_config(EMAIL, new_email)
  end

  # Private methods

  def read_git_config(attribute)
    %x[git config #{attribute}].strip
  end

  def write_git_config(attribute, new_value)
    %x[git config --global "#{attribute}" "#{new_value}"]
  end

  private_class_method :read_git_config, :write_git_config
end

#
# If the given string_value is blank, then
# prompts the user to enter a value.
#
def ask_user_if_blank(string_value, prompt)
  return string_value unless string_value.to_s.strip.empty?

  user_value = ''
  while user_value.strip.empty?
    print "Enter #{prompt}: "
    user_value = gets.chomp
  end

  user_value
end
