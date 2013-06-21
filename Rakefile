require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'yard'

task :ci => [:test]

Rake::TestTask.new do |test|
  test.libs << "lib"
  test.libs << "spec"
  test.pattern = 'spec/**/*_spec.rb'
  test.verbose = true
  test.warning = true
end

YARD::Rake::YardocTask.new
task :docs => :yard

task :default => :ci
