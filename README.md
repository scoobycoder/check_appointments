+# The Check Appointments Ruby Gem
 +A Ruby wrapper for the Check Appointments API
 +
 +## <a name="installation">Installation</a>
 +Add it to your Gemfile:
 +  gem 'check_appointments'
 +Run the following command to install it:
 +  bundle install
 +Or from the command line, run:
 +  gem install check_appointments
 +
 +#Setup & Configuration
 +1. Make an initializer by creating a file called check_appointments.rb in 'config\initializers' and adding the following to the file:
 +
 +<b></b>
 +  # Added to your `config\initializers` file
 +  CheckAppointments.configure do |config|
 +    config.api_key = 'YOUR_CHECK_APPOINTMENTS_API_KEY'
 +    config.private_key = 'YOUR_CHECK_APPOINTMENTS_PRIVATE_KEY'
 +    config.base_url = 'https://checkappointments.com/businessWeb'
 +  end
 +
 +#Usage Example(s)
 +  #Get all the appointments, this might take a while if you have a lot of them.
 +  CheckAppointments::Appointment.find_all
 +
 +#Contribute
 +Please feel free to help out in any way you can.  Make a suggestion, correct a typo, report a bug, etc.
 +
 +#Submitting an Issue
 +We use the GitHub Issue Tracker to track bugs and features.
 +
 +#Supported Rubies
 +* Ruby = 1.8.7
 +* Ruby >= 1.9
 +
 +#Todos
 +* Need to fully implement testing
