module Mechany
  module Service
    class Group
      attr_accessor :supervisor, :path, :clazz

      def initialize(options = {})
        @path = options[:path] || Dir.pwd + '/services'
        @clazz = options[:clazz] || Dsl::Service
      end

      def init 
        Dir.glob(path + "/*.yml").each do |path|
          self.supervisor = clazz.supervise(reader: Dsl::Reader.new(path))
        end
        supervisor.actors.each { |actor| actor.start }
      end
    end
  end
end
