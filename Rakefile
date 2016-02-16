#!/usr/bin/env rake
require "bundler/gem_tasks"

<<<<<<< HEAD
task :default => [:build]

desc "build_app" do
  task :build do
    bundle install
    gem build check_appointments
  end
end

desc "test application" do
  task :spec do
    p 'done'
  end
end



=======
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/check_appointments'
  t.test_files = FileList['test/lib/check_appointments/*_test.rb']
  t.verbose = true
end

task :default => :test
>>>>>>> travis_master/master
