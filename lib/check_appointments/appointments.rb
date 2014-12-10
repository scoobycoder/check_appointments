module CheckAppointments
  class Appointment
    def self.create_signature(body)
      Digest::MD5.hexdigest( body )
    end

    # Returns array of :
    # {"calendarId"=>int, "businessId"=>int, "date"=>"2014-02-11", "startTime"=>int, "endTime"=>int,
    #  "staffTimeText"=>"Tuesday, Feb 11, 2014 at 6:00 PM EST", "client"=>{"clientId"=>int, "fullName"=>string,
    #  "firstName"=>string, "lastName"=>string, "dateOfBirth"=>string, "sex"=>string, "ssn"=>string, "emailAddress"=>string,
    #  "address1"=>string, "address2"=>string, "city"=>string, "county"=>string, "state"=>string, "zip"=>string, "country"=>string,
    #  "homePhone"=>string, "cellPhone"=>string, "createdDate"=>"2013-10-16 18:20:38"}, "staff"=>{"professionalId"=>int,
    #  "fullName"=>string, "userName"=>string, "email"=>string, "phone"=>string, "active"=>boolean, "acceptAppointments"=>boolean,
    #  "businessId"=>int}, "location"=>{"locationId"=>int, "locationName"=>string, "businessId"=>int, "active"=>boolean,
    #  "address1"=>string, "address2"=>string, "city"=>string, "state"=>string, "zip"=>string, "country"=>string}}
    def self.find_all
      api_url = "/rest/appointments/#{CheckAppointments.api_key}/all/all"
      time_stamp = Time.now.utc.to_i
      sig = create_signature( CheckAppointments.api_key + CheckAppointments.private_key + time_stamp.to_s + api_url )
      response =  RestClient.get CheckAppointments.base_url + api_url ,
                                  {:params => {:apiKey => CheckAppointments.api_key, :timestamp => time_stamp, :signature => sig }}
      # response = RestClient::Request.execute :method => :get, :url => CheckAppointments.base_url + api_url, :payload => {:apiKey => CheckAppointments.api_key, :timestamp => time_stamp, :signature => sig}, :ssl_version => 'TLSv1'

      appointments = JSON.parse(response)
      response = []
      appointments.each { |appointment| response << appointment }

      response
    end
  end
end
