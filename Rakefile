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

#------------------------------------------------------------
# CUSTOM INSTALLATION LOCATION/TARGET
# (Other than ~/.filename)
#
# Add settings files that need to be installed to a custom
# target (which is not $HOME)
#------------------------------------------------------------

DOTFILES_WITH_CUSTOM_TARGET = [
  { 'atom_keymap.cson'                   => "#{Dir.home}/.atom/keymap.cson" }
]

#------------------------------------------------------------
# CUSTOM INSTALLATION PROCESS
#
# Add settings files that need a custom installation process
# e.g. gitconfig, which needs to read the preexisting
# username and email and add it to the new .gitconfig file
#------------------------------------------------------------

GITCONFIG_SOURCE = 'gitconfig'
GITCONFIG_TARGET =  "#{Dir.home}/.gitconfig"
DOTFILES_WITH_CUSTOM_INSTALL = [
  { GITCONFIG_SOURCE => GITCONFIG_TARGET }
]

#------------------------------------------------------------
# DO NOT EDIT BELOW
#
# You should not need to edit anything below
# unless you are doing a custom install or
# fixing bugs.
#------------------------------------------------------------

def sources(dotfiles_map)
  dotfiles_map.map { |h| h.keys.first }
end

def targets(dotfiles_map)
  dotfiles_map.map { |h| h.values.first }
end

GENERAL_DOTFILES = FileList['*']
                     .exclude(
                       'Rakefile',
                       'README.*',
                       *sources(DOTFILES_WITH_CUSTOM_TARGET),
                       *sources(DOTFILES_WITH_CUSTOM_INSTALL))

GENERAL_TARGETS = GENERAL_DOTFILES.pathmap("#{Dir.home}/.%f")

ALL_TARGETS = [
  *GENERAL_TARGETS,
  *targets(DOTFILES_WITH_CUSTOM_TARGET),
  *targets(DOTFILES_WITH_CUSTOM_INSTALL)
]

desc 'Install all dotfiles'
task default: ALL_TARGETS
CLOBBER.concat(ALL_TARGETS)

GENERAL_DOTFILES.each_index do |i|
  desc "Install #{GENERAL_DOTFILES[i]}"
  file GENERAL_TARGETS[i] => GENERAL_DOTFILES[i] do |task|
    cp task.prerequisites.first, task.name
  end
end

DOTFILES_WITH_CUSTOM_TARGET.each do |h|
  source = h.keys.first
  target = h.values.first

  desc "Install #{source}"
  file target => source do |task|
    cp task.prerequisites.first, task.name
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
