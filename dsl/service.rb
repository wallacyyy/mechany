module Dsl
  require_relative '../endpoints/mailing/delivery'
  require_relative '../endpoints/soap/request'
  require_relative '../endpoints/http/http'
  require_relative '../dsl/reader'

  ##
  # Reads dsl files and delegates the params to services. 
  class Service 
    include Virtus.model
    include Celluloid

    attribute :reader, Dsl::Reader
    # Hash of variables that come from the endpoint responses 
    attribute :variables, Hash, default: {}
    # The last executed endpoint response
    attribute :response

    ##
    # Endpoints to be fetched from start method
    def endpoints
      { 'mail' => Endpoint::Mailing::Delivery,
        'soap' => Endpoint::Soap::Request,
        'xslt' => Endpoint::Utils::Xslt,
        'http' => Endpoint::Http }
    end

    ##
    # Call an endpoint  
    # An service calls an execution pipeline of endpoints, transfering
    # the response of one to the default receiver field of the next endpoint.
    # Each node is locked on exclusive mode until finish.
    # An group of services is called by an client, the service results is received
    # with an pipeline of async celluloid futures.
    # The services are async between them, but sync by itself.
    def start
      nodes = reader.nodes
      nodes.each do |key, value|
        clazz = endpoints[key]
        if attr = nodes[key]['response']
          nodes[key].delete('response')
        end

        params = nodes[key]
        params.each do |key, value| 
          value[0] == '$' ? var = variables[value] : var = value
          params[key] = var
        end
        endpoint = clazz.new(params)
        variables[attr] = endpoint.call
      end
    end

  end
end
