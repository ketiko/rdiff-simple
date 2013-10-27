require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

Bundler.require(:default)

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :spec do
  task :integration do
    exec "vagrant ssh -c '/vagrant/bin/rspec /vagrant/spec/integration'"
  end
end

