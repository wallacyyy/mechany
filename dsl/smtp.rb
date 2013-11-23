module Dsl
  # Contains all the rules for the smtp configuration DSL.
  module Smtp
    # Attributes that are allowed on the DSL language for the Smtp domain
    def allowed_attributes
      [ 'address', 'port', 'domain', 'domain', 'user_name', 
        'password', 'authentication', 'enable_starttls_auto' ]
    end
  end
end
