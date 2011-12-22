require 'rake'
require 'erb'

task :default => [:install]

desc "install the dot files into home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README README.markdown].include? file
    target = File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")

    if File.exist? target
      if File.identical? file, target
        puts "identical #{target}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite #{target} [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping #{target}"
        end
      end
    else
      link_file(file)
    end
  end
end

desc "bootstrap vim installation"
task "vim:bootstrap" do
  path = File.join(ENV['HOME'], ".vim/bundle/vundle/")
  system "git clone http://github.com/gmarik/vundle.git #{path}" unless File.directory? path
  system "mkdir -p ~/.vim/backup/"
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

