module Endpoint
  module Soap
    require 'savon'

    class Client
      attr_accessor :wsdl

      def initialize(wsdl)
        @wsdl = wsdl
      end

      def instance
        Savon.client(wsdl: @wsdl, log: false)
      end
    end
  end
end
