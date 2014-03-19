module Dsl
  ##
  # Contains all the rules for the soap configuration DSL.
  module Soap

    ##
    # Attributes that are allowed on the DSL language for the Soap domain
    # The path of the file will be retrieved from /integrations/soap/requests/
    def allowed_attributes
      [ 'wsdl', 'file_path', 'file_path', 'xml' ] 
    end
  end
end
