module Endpoint
  module Soap
    require 'savon'
    require_relative '../../dsl/reader'

    class Request
      include Virtus.model

      attribute :file_path, String
      attribute :client

      def result
        service = client
        xml = Dsl::Reader.new(file_path: file_path).xml
        response = service.call(:get_info_by_zip, xml: xml)
      end
    end
  end
end
