module Endpoint
  module Mailing
    require 'yaml'
    require './dsl/reader'
    require './dsl/smtp'
    ##
    # Provides the smtp server configuration.
    class Smtp
      include Virtus.model
      include Dsl::Smtp

      ##
      # Options hash for the smtp server. It's basically an
      # an wrapper for the mail gem configs.
      attribute :address, String, default: 'localhost'
      attribute :port, Integer, default: 25
      attribute :domain, String
      attribute :user_name, String
      attribute :password, String
      attribute :authentication, String
      attribute :enable_starttls_auto, Boolean, default: true

      ##
      # Configuration file path.
      attribute :config_path, String, default: 'config/mail.yml'

      ##
      # Fetch the configuration from the configuration file.
      def set_options
        reader = Dsl::Reader.new(file_path: config_path)
        allowed_attributes.each do |attr|
          value = reader.value(attr)
          send("#{attr}=", value)
        end
      end
    end
  end
end
