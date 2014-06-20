module Mechany
  module Endpoint
    class Http
      attr_accessor :url

      def initialize(options = {})
        @url = options[:url]
      end

      def get
        HTTParty.get(@url)
      end

      def call 
        get
      end

      def allowed_attributes
        [:url] 
      end
    end
  end
end
