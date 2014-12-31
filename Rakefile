task :default => [:git, :vim]

task :vim do
  install_dotfiles 'vimrc'
end

task :git do
  user_name = read_git_config_attribute('user.name') # TODO: extract constant, or add GitConfig singleton class?
  user_email = read_git_config_attribute('user.email') # TODO: Validate email to ensure "[ENter...] does not work"

  install_dotfiles %w[gitconfig gitignore_global gitattributes_global]

  write_git_config_attribute('user.name', user_name) # TODO: ask user to input if invalid or empty. Username = gets.strip
  write_git_config_attribute('user.email', user_email)
end

private

  def install_dotfiles(dotfiles)
    Array(dotfiles).each do |dotfile|
      cp dotfile, File.join(Dir.home, ".#{dotfile}")
    end
  end

  def read_git_config_attribute(attribute)
    %x[git config #{attribute}].strip
  end

  def write_git_config_attribute(attribute, value)
    sh %Q[git config --global "#{attribute}" "#{value}"]
  end
