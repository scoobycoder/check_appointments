module CheckAppointments
  class Appointment
    def self.create_signature(body)
      Digest::MD5.hexdigest( body )
    end

    #  Parse with Hash.from_xml(a)
    def self.find_all
      api_url = "/rest/appointments/#{CheckAppointments.api_key}/all/all"
      time_stamp = Time.now.utc.to_i
      sig = create_signature( CheckAppointments.api_key + CheckAppointments.private_key + time_stamp.to_s + api_url )
      response =  RestClient.get CheckAppointments.base_url + api_url ,
                  {:params =>
                    {:apiKey => CheckAppointments.api_key,
                     :timestamp => time_stamp,
                     :signature => sig }}

      response
      # Parse with hash = Hash.from_xml(response)
      # appointments = hash["ArrayList"]["item"] returns an array of appointments (hashes)
    end
  end
end
