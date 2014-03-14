module Endpoint
  module Soap
    require 'savon'
    require_relative '../../dsl/reader'
    require_relative 'client'
    ##
    # Handles the requests to SOAP web services. 
    class Request
      include Virtus.model

      # The path to file that contains a request.
      attribute :file_path, String
      # Client that will be called to send the request.
      attribute :wsdl

      ##
      # Sends the request to an soap web service through the client.
      # Expects the operation name as symbol
      def result(operation)
        xml = Dsl::Reader.new(file_path: file_path).xml
        client = Endpoint::Soap::Client.new(wsdl: wsdl).instance
        client.call(operation, xml: xml)
      end
    end
  end
end
