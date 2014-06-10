module Dsl
  require './endpoints/mailing/delivery'
  require './endpoints/soap/request'
  require './endpoints/http/http'
  require './dsl/reader'

  class Service 
    include Celluloid

    attr_accessor :response, :variables

    def initialize(reader)
      @variables = {}
      @reader = reader || Dsl::Reader
    end

    def endpoints
      { mail:  Endpoint::Mailing::Delivery,
        soap: Endpoint::Soap::Request,
        xslt: Endpoint::Utils::Xslt,
        http: Endpoint::Http }
    end

    def start
      nodes = @reader.nodes
      nodes.each do |node|
        params = node.values.first
        params.delete('response') if (attr = params['response'])
        name = node.keys.first
        params.each do |key, value|
          node[name][key] = @variables[value] if (value[0] == '$')
        end
        clazz = endpoints[name.to_sym]
        hash = node[name].inject({}){ |memo, (k,v)| memo[k.to_sym] = v; memo } 
        endpoint = clazz.new(hash)
        @variables[attr] = endpoint.call
      end
    end

  end
end
