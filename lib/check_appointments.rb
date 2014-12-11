module CheckAppointments
  require 'rest_client'
  require 'mime-types'
  require 'rdoc'
  require 'json'
  require 'check_appointments/client.rb'
  require 'check_appointments/appointments.rb'
  require 'check_appointments/configuration.rb'

  extend Configuration
end
