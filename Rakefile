require 'rake'

desc "Hook our dotfiles into system-standard positions."
task :install do
  linkables = Dir.glob('*{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do
  Dir.glob('**/*.symlink').each do |linkable|
    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end
  end
end

namespace :bootstrap do
  desc "bootstrap vim configuration"
  task "vim" do
    puts "+++ Configuring vim"
    path = File.join(ENV['HOME'], ".vim/bundle/vundle/")
    system "git clone http://github.com/gmarik/vundle.git #{path}" unless File.directory? path
    system "mkdir -p ~/.vim/backup/"
  end

  desc "bootstrap homebrew"
  task "homebrew" do
    return unless RbConfig::CONFIG['host_os'] =~ /darwin/

    if not File.exists? '/usr/local/bin/brew'
      puts "+++ Installing homebrew"
      sh "/usr/bin/ruby -e \"$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)\""
    end

    puts "+++ Updating hombrew formulae"
    `brew update`

    packages = []
    FileList["brew/*.brew"].each do |f|
      file = File.new(f, "r")
      while (line = file.gets)
        packages << line.chomp if not line =~ /^#.*/ #ignore commented out packages
      end
    end

    installables = packages - `brew list`.split(/\s/)

    puts "+++ Installing homebrew packages"
    installables.each do |p|
      sh "brew install #{p}" do |ok, res|
        #do nothing, don't die when brew throws an error if already installed
      end
    end
  end

  desc "bootstrap zsh install"
  task "zsh" do
    zsh_path = '/usr/local/bin/zsh'
    if File.exists? zsh_path
      puts "+++ Changing shell"
      `chsh -s zsh_path`
    else
      puts "zsh not installed in #{zsh_path}"
    end
  end
end

task :default => 'install'
