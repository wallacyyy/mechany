module Endpoint
  module Soap
    require 'savon'
    ##
    # Represents the SOAP client that will be called to make requests
    # to soap web services.
    class Client
      include Virtus.model

      # The web service wsdl url. 
      attribute :wsdl, String

      ## 
      # Returns an savon client with the given wsdl url.
      def instance
        Savon.client(wsdl: wsdl, log: false)
      end
    end
  end
end
