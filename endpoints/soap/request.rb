module Endpoint
  module Soap
    require 'savon'
    require_relative '../../dsl/reader'

    class Request
      include Virtus.model

      attribute :file_path, String
      attribute :client

      def result
        xml = Dsl::Reader.new(file_path: file_path).xml
        response = client.call(:get_info_by_zip, xml: xml)
      end
    end
  end
end
