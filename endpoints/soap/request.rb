module Endpoint
  module Soap
    require 'savon'
    require './dsl/reader'
    require './endpoints/soap/client'

    class Request
      attr_accessor :xml, :file_path, :wsdl, :operation

      def initialize(options = {})
        @file_path = options[:file_path]
        @xml = options[:xml]
        @wsdl = options[:wsdl]
        @operation = options[:operation]
      end
     
      def result
        payload = xml || Dsl::Reader.new(file_path).xml
        client = Endpoint::Soap::Client.new(wsdl).instance
        client.call(operation.to_sym, xml: payload)
      end

      def call
        result.http.raw_body
      end
    end
  end
end
