require "bundler/gem_tasks"

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



