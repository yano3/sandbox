require 'rake'

HOME = File.expand_path('~')
SRC  = File.expand_path('.')

dotfiles = [
  '.hoge',
  '.fuga'
]

task :install => [:backup, :link]

desc 'create symbolic links'
task :link do
  dotfiles.each do |file|
    symlink(SRC + '/' + file, HOME + "/" + file);
  end
end

desc 'backup files'
task :backup do
  dotfiles.each do |file|
    if !File.symlink?(HOME + "/" + file) then
      move(HOME + "/" + file, HOME + "/" + file + '.' + Time.now.strftime('%Y%m%d%H%M%S'));
    else
      puts 'deleting symlink'
      rm(HOME + "/" + file);
    end
  end
end

