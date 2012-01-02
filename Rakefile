require 'bundler'
require 'rake/clean'
require 'rake/testtask'
gem 'rdoc' # we need the installed RDoc gem, not the system one
require 'rdoc/task'
require 'erb'

include Rake::DSL

Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.pattern = 'test/tc_*.rb'
end

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc","lib/**/*.rb","bin/**/*")
end

# compile 'README.md.erb' file into 'README.md' file
task :readme do
  puts "Compiling README.md"
  @usage = `ruby bin/previews --help`.gsub(/^Usage: /, "Usage:\n```\n") + "```"
  File.open("README.md", "w") do |f|
    f.write ERB.new(File.new("README.md.erb", "r").read).result(binding)
  end
end

task :default => [:test]