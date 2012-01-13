require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.rcov = true
end

desc "Build the .gem file"
task :build do
  `gem build contact_printer.gemspec`
end

desc "installs the gem from the .gem file. then remove the .gem file."
task :install => :build do
  `gem install contact_printer`
  `rm *.gem`
end

task :default => :spec

