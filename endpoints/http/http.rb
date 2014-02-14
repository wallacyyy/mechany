module Endpoint
  require 'httparty'
  ##
  # Handles generic http requests.
  class Http
    include Virtus.model
    include HTTParty
    include Celluloid

    # Url that the client will send the request.
    attribute :url, String

    ##
    # Sends an basic GET request.
    def get
      HTTParty.get(url)
    end

  end
end
