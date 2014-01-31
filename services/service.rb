module Mechany
  ##
  # One service can get 1..* endpoints.   
  # The service itself is an async operation, but the methods through the integration aren't.
  class Service
    include Celluloid

    attribute :id, Integer
    attribute :endpoints, Array

  end
end
