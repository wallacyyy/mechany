module Service
  class Group
    attribute :path, default: Dir.pwd + "/services" 

    def init 
      Dir.glob(path + "/*.yml").each do |path|
        service = Dsl::Service.supervise(reader: Dsl::Reader.new(file_path: path))
      end
    end

  end
end
