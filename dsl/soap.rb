module Dsl
  ##
  # Contains all the rules for the soap configuration DSL.
  module Soap

    ##
    # Attributes that are allowed on the DSL language for the Soap domain
    # Example: 
    # url: http://google.com/thisisansoapwebservice.wsdl
    # request: googlewebservicerequest.xml
    # The path of the file will be retrieved from /integrations/soap/requests/
    def allowed_attributes
      [ 'url', 'request' ] 
    end
  end
end
