module Endpoint
  module Soap
    require 'savon'

    class Client
      include Virtus.model

      attribute :wsdl, String

      def with_savon
        Savon.client(wsdl: wsdl)
      end
    end
  end
end
