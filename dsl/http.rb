module Dsl
  ##
  # Contains all the rules for the soap configuration DSL.
  module Http

    ##
    # Attributes that are allowed on the DSL language for the Http domain
    def allowed_attributes
      [ 'url', 'parameters' ]
    end
  end
end
