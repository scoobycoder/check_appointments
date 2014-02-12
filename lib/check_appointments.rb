module CheckAppointments
require 'rest_client'
require 'mime-types'
require 'netrc'
require 'rdoc'
require 'JSON'

  API_KEY = 'MATHPLUSACADEMY'
  PRIVATE_KEY = 'kuhgwcy2895ny845ciuy5cno82mo5coiuc598yn'
  BASE_URL = 'https://checkappointments.com/businessWeb'

  class Client
    def self.create_signature(body)
      Digest::MD5.hexdigest( body )
    end

    #Pulls all clients
    def self.find_all
      api_key = CheckAppointments::API_KEY
      api_url = '/rest/clients'
      time_stamp = Time.now.utc.to_i
      private_key = CheckAppointments::PRIVATE_KEY
      sig = create_signature( api_key + private_key + time_stamp.to_s + api_url )
      response =  RestClient.get CheckAppointments::BASE_URL + api_url,
                                  {:params => {:apiKey => api_key, :timestamp => time_stamp, :signature => sig }}
      response
    end

    # Pulls all clients created on specific date. Accepts Date object.
    def self.created_on( date )
      date = date.strftime("%Y-%m-%d")
      api_key = CheckAppointments::API_KEY
      api_url = "/rest/clients/createdOn/#{date}"
      time_stamp = Time.now.utc.to_i
      private_key = CheckAppointments::PRIVATE_KEY
      sig = create_signature( api_key + private_key + time_stamp.to_s + api_url )
      response =  RestClient.get CheckAppointments::BASE_URL + api_url,
                                  {:params => {:apiKey => api_key, :timestamp => time_stamp, :signature => sig }}
      response
    end
  end

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
      api_key = CheckAppointments::API_KEY
      api_url = "/rest/appointments/#{api_key}/all/all"
      time_stamp = Time.now.utc.to_i
      private_key = CheckAppointments::PRIVATE_KEY
      sig = create_signature( api_key + private_key + time_stamp.to_s + api_url )
      response =  RestClient.get CheckAppointments::BASE_URL + api_url ,
                                  {:params => {:apiKey => api_key, :timestamp => time_stamp, :signature => sig }}

      appointments = JSON.parse(response)
      response = []
      appointments.each do |appointment|
        response << appointment
      end

      response
    end
  end
end
