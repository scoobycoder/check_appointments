module CheckAppointments
  require 'rest-client'
  require 'mime-types'
  require 'rdoc'
  require_relative 'check_appointments/client.rb'
  require_relative 'check_appointments/appointments.rb'
  require_relative 'check_appointments/configuration.rb'
  require_relative 'check_appointments/version.rb'

  extend Configuration
end
