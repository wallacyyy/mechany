module Mechany
  module Endpoint
    module Soap
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
end
