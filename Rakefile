require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'yard'

task :ci => [:docs]

YARD::Rake::YardocTask.new
task :docs => :yard

task :default => :ci
