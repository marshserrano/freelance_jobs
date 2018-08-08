# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require "bundler/gem_tasks"

Rails.application.load_tasks

desc "Fixes css image paths in scss files."
task :fix_css do
  Dir.glob(File.join("app/assets/stylesheets/dataTables", "*.scss")).each do |filename|
    content = File.read(filename)
    content.gsub!(/url\('\.\.\/images\/([A-Za-z0-9_]*\.png)'\)/) do
      "image-url('dataTables/#{$1}')"
    end
  	File.open(filename, 'w') { |f| f << content }
  end
  print "Done.\n"
end
