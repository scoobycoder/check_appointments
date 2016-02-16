#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/check_appointments'
  t.test_files = FileList['test/lib/check_appointments/*_test.rb']
  t.verbose = true
end

task :default => :test
