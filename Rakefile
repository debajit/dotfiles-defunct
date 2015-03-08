task default: [:git, :aliases, :vim, :rubocop]

desc 'Install Git configuration files'
task :git do
  user_name = GitConfig.instance.user_name
  user_email = GitConfig.instance.user_email # TODO: Validate email to ensure "[ENTER...] does not work"

  install_dotfiles %w[gitconfig gitignore_global gitattributes_global] # TODO: Add test

  GitConfig.instance.user_name = user_name # TODO: ask user to input if invalid or empty. Username = gets.strip
  GitConfig.instance.user_email = user_email
end

desc 'Install Aliases'
task :aliases do
  install_dotfiles 'aliases'
end

desc 'Install Vim configuration files'
task :vim do
  install_dotfiles 'vimrc'
end

desc 'Install RuboCop configuration file'
task :rubocop do
  install_dotfiles 'rubocop.yml'
end

desc 'Install TextMate keyboard settings'
task :textmate do
  cp 'textmate-keybindings.dict', File.join("#{Dir.home}/Library/Application\ Support/TextMate", 'Keybindings.dict')
end

desc 'Install emacs configuration files'
task :emacs do
  EMACS_CONFIG_DIR = File.join(Dir.home, '.emacs.d')

  mkdir_p EMACS_CONFIG_DIR

  # Symlink all emacs config files in emacs.d/ to ~/.emacs.d/
  source_files = Dir.glob('emacs.d/*')
  source_files.each do |source_file|
    target_file = File.join(EMACS_CONFIG_DIR, File.basename(source_file))
    source_file = File.absolute_path(source_file)
    ln_s source_file, target_file, force: true
  end

  # Check if Cask is installed
  unless File.exist?(File.join(Dir.home, ".cask"))
    fail 'Cask not found. Please install Cask. See the directions at http://cask.readthedocs.org/en/latest/guide/installation.html'
  end

  # Install any emacs' packages required
  cd EMACS_CONFIG_DIR do
    sh 'cask install'
  end
end

private

  def install_dotfiles(dotfiles)
    Array(dotfiles).each do |dotfile|
      cp dotfile, File.join(Dir.home, ".#{dotfile}")
    end
  end

  class GitConfig
    include Singleton
    
    USER_NAME = 'user.name'
    USER_EMAIL = 'user.email'
            
    def user_name
      read_git_config_attribute(USER_NAME) # TODO: DRY. Use metaprogramming to generate accessors
    end
    
    def user_name=(new_user_name)
      write_git_config_attribute(USER_NAME, new_user_name)
    end
    
    def user_email
      read_git_config_attribute(USER_EMAIL)
    end
    
    def user_email=(new_user_email)
      write_git_config_attribute(USER_EMAIL, new_user_email)
    end
      
    def read_git_config_attribute(attribute)
      %x[git config #{attribute}].strip
    end

    def write_git_config_attribute(attribute, value)
      %x[git config --global "#{attribute}" "#{value}"]
    end  
  end
