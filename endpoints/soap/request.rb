module Endpoint
  module Soap
    require 'savon'
    require_relative '../../dsl/reader'
    ##
    # Handles the requests to SOAP web services. 
    class Request
      include Virtus.model

      # The path to file that contains a request.
      attribute :file_path, String
      # Client that will be called to send the request.
      attribute :client

      ##
      # Sends the request to an soap web service through the client.
      def result
        xml = Dsl::Reader.new(file_path: file_path).xml
        response = client.call(:get_info_by_zip, xml: xml)
      end
    end
  end
end
