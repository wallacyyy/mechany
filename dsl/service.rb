module Dsl
  require_relative '../endpoints/mailing/delivery'
  require_relative '../endpoints/soap/request'
  require_relative '../endpoints/http/http'

  ##
  # Reads dsl files and delegates the params to services. 
  class Service 

    ENDPOINTS = {
      :mail => Endpoint::Mailing::Delivery,
      :soap => Endpoint::Soap::Request,
      :http => Endpoint::Http
    }

    ##
    # Call an endpoint.  
    def self.call(endpoint)
      ENDPOINTS[endpoint.to_sym]
    end

  end
end
