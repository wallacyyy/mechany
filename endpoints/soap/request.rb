module Endpoint
  module Soap
    require 'savon'
    require_relative '../../dsl/reader'
    require_relative 'client'
    ##
    # Handles the requests to SOAP web services. 
    class Request
      include Virtus.model

      attribute :xml, String
      # The path to file that contains a request.
      attribute :file_path, String
      # Client that will be called to send the request.
      attribute :wsdl
      # Operation that will be called on request.
      attribute :operation

      ##
      # Sends the request to an soap web service through the client.
      # Expects the operation name as symbol
      def result
        payload = xml || Dsl::Reader.new(file_path: file_path).xml
        client = Endpoint::Soap::Client.new(wsdl: wsdl).instance
        client.call(operation.to_sym, xml: payload)
      end

      def call
        result.http.raw_body
      end
    end
  end
end
