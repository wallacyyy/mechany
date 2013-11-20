module Endpoint
  module Mail
    require 'yaml'
    require_relative '../../dsl/reader'
    ##
    # Provides the smtp server configuration.
    class Smtp
      include Virtus.model
      include Dsl::Smtp

      # Options hash for the smtp server
      attribute :address, String, default: 'localhost'
      attribute :port, Integer, default: 25
      attribute :domain, String
      attribute :user_name, String
      attribute :password, String
      attribute :authentication, String
      attribute :enable_starttls_auto, Boolean, default: true

      ##
      # Fetch the configuration
      def set_options
      end

      ##
      # Configuration file path.
      def config_path
        'config/mail.yml'
      end
    end
  end
end
