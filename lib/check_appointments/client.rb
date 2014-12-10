module CheckAppointments
  class Client
    def self.create_signature(body)
      Digest::MD5.hexdigest( body )
    end

    #Pulls all clients
    def self.find_all
      api_url = '/rest/clients'
      time_stamp = Time.now.utc.to_i
      sig = create_signature( CheckAppointments.api_key + CheckAppointments.private_key + time_stamp.to_s + api_url )
      # response =  RestClient.get CheckAppointments.base_url + api_url,
      #                             {:params => {:apiKey => CheckAppointments.api_key, :timestamp => time_stamp, :signature => sig }}
      response = RestClient::Request.execute :method => :get, :url => CheckAppointments.base_url + api_url, :payload => {:apiKey => CheckAppointments.api_key, :timestamp => time_stamp, :signature => sig}, :ssl_version => 'TLSv1'
      response
    end

    # Pulls all clients created on specific date. Accepts Date object.
    def self.created_on( date )
      date = date.strftime("%Y-%m-%d")
      api_url = "/rest/clients/createdOn/#{date}"
      time_stamp = Time.now.utc.to_i
      sig = create_signature( CheckAppointments.api_key + CheckAppointments.private_key + time_stamp.to_s + api_url )
      # response =  RestClient.get CheckAppointments.base_url + api_url,
      #                             {:params => {:apiKey => CheckAppointments.api_key, :timestamp => time_stamp, :signature => sig }}
      response = RestClient::Request.execute :method => :get, :url => CheckAppointments.base_url + api_url, :payload => {:apiKey => CheckAppointments.api_key, :timestamp => time_stamp, :signature => sig}, :ssl_version => 'TLSv1'
      response
    end
  end
end
