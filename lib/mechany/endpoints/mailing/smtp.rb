module Mechany
  module Endpoint
    module Mailing
      class Smtp
        attr_accessor :domain, :user_name, :password, :authentication, 
                      :config_path, :address, :port, :enable_starttls_auto

        def initialize(options = {})
          @config_path = options[:config_path] || '/config/mail.yml'
          @address = options[:address] || 'localhost'
          @enable_starttls_auto = options[:enable_starttls_auto] || true
          @port = options[:port] || 25
        end

        def set_options
          reader = Dsl::Reader.new(@config_path)
          allowed_attributes.each do |attr|
            value = reader.value(attr)
            send("#{attr}=", value)
          end
        end

        def allowed_attributes
          ['domain', 'user_name', 'password', 'authentication',
           'config_path', 'address', 'port', 'enable_starttls_auto']
        end

        def as_hash
          hash = {}
          instance_variables.each do |var|
            hash[var.to_s.delete('@').to_sym] = instance_variable_get(var)
          end
          hash
        end
      end
    end
  end
end
