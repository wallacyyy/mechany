module Dsl
  ##
  # Reads dsl files and delegates the params to services. 
  class Endpoint 

    SERVICES = {
      :mail => Endpoint::Mailing::Delivery,
      :soap => Endpoint::Soap::Request,
      :http => Endpoint::Http
    }

    ##
    # Call an service.  
    def self.call
      SERVICES[endpoint.to_sym]
    end

  end
end
