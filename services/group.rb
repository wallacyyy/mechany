module Service
  require_relative '../dsl/service'

  class Group
    include Virtus.model

    attribute :path, String, default: Dir.pwd + "/services" 
    attribute :clazz, Object, default: Dsl::Service
    attribute :supervisor

    def init 
      Dir.glob(path + "/*.yml").each do |path|
        self.supervisor = clazz.supervise(reader: Dsl::Reader.new(file_path: path))
      end
      supervisor.actors.each do |actor|
        actor.start
      end
    end

  end
end
