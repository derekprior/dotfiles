require 'rake'
require 'erb'

TEXTMATE_BUNDLES = File.expand_path "~/Library/Application Support/TextMate/Bundles"

task :default => [:install]

desc "install the dot files into home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README README.markdown].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

desc "install/refresh textmate bundles"
task :tmbundles do
  FileUtils.mkdir TEXTMATE_BUNDLES unless File.exists?(TEXTMATE_BUNDLES) 
  git_bundle 'git://github.com/rspec/rspec-tmbundle.git', 'RSpec.tmbundle'
  git_bundle 'git://github.com/drnic/ruby-on-rails-tmbundle.git', 'Ruby on Rails.tmbundle'
  git_bundle 'git://github.com/cucumber/cucumber-tmbundle.git', 'Cucumber.tmbundle'
  git_bundle 'git://github.com/kuroir/SCSS.tmbundle.git', 'SCSS.tmbundle'
  git_bundle 'git://github.com/jcf/git-tmbundle.git', 'Git.tmbundle'
  git_bundle 'git://github.com/jondruse/perforce-tmbundle.git', 'Perforce.tmbundle'
  git_bundle 'git://github.com/jashkenas/coffee-script-tmbundle', 'CoffeeScript.tmbundle'
  git_bundle 'git://github.com/kswedberg/jquery-tmbundle.git', 'JavaScript jQuery.tmbundle'
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

def svn_bundle(repo, name=nil)
  sh "cd #{escape_path(TEXTMATE_BUNDLES)}; svn co #{escape_path(repo)} #{escape_path(name)}"
end

def git_bundle(repo, name)
  if File.exists?("#{TEXTMATE_BUNDLES}/#{name}")
    sh "cd #{escape_path(TEXTMATE_BUNDLES)}; cd #{escape_path(name)}; git pull"
  else
    sh "cd #{escape_path(TEXTMATE_BUNDLES)}; git clone #{repo} #{escape_path(name)}"
  end
end

def escape_path(name)
  name.gsub(' ', '\ ')
end
