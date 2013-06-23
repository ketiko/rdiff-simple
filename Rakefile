require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rake/testtask'

task :ci => [:test]

Rake::TestTask.new do |test|
  test.libs << "bin"
  test.libs << "lib"
  test.libs << "spec"
  test.pattern = 'spec/**/*_spec.rb'
end

task :default => :ci
