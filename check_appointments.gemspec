Gem::Specification.new do |s|
  s.name = %q{check_appointments}
  s.version =   VERSION = '0.0.7'.freeze unless defined?(::CheckAppointments::VERSION)
  s.date = %q{2015-02-18}
  s.summary = %q{Gem that interfaces with the CheckAppointments API}
  s.files = Dir["README.md","Gemfile","Rakefile", "lib/**/*"]
  s.authors     = ["Travis Sperry"]
  s.email       = 'tsperry1@gmail.com'
  s.require_paths = ["lib"]
  s.license       = 'MIT'
end
