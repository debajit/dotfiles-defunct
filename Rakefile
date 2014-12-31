task :default => [:git, :vim]

desc 'Install Vim configuration files'
task :vim do
  install_dotfiles 'vimrc'
end

desc 'Install Git configuration files'
task :git do
  user_name = GitConfig.instance.user_name
  user_email = GitConfig.instance.user_email # TODO: Validate email to ensure "[ENTER...] does not work"

  install_dotfiles %w[gitconfig gitignore_global gitattributes_global] # TODO: Add test

  GitConfig.instance.user_name = user_name # TODO: ask user to input if invalid or empty. Username = gets.strip
  GitConfig.instance.user_email = user_email
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
    
  private
  
    def read_git_config_attribute(attribute)
      %x[git config #{attribute}].strip
    end

    def write_git_config_attribute(attribute, value)
      %x[git config --global "#{attribute}" "#{value}"]
    end  
  end
