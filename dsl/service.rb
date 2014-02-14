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

    def endpoints
      { :mail => Endpoint::Mailing::Delivery,
        :soap => Endpoint::Soap::Request,
        :http => Endpoint::Http }
    end

    ##
    # Call an endpoint  
    # An service calls an execution pipeline of endpoints, transfering
    # the response of one to the default receiver field of the next endpoint.
    # Each node is locked on exclusive mode until finish.
    # An group of services is called by an client, the service results is received
    # with an pipeline of async celluloid futures.
    # The services are async between them, but sync by itself.
    def run
      nodes = reader.nodes
      response = nil
      nodes.each do |node|
        exclusive do
          clazz = endpoints[node.to_sym]
          endpoint = clazz.new(node)
          result = endpoint.call(node, parameters, response)
          response = result
          endpoint.terminate
        end
      end
    end

  end
end
