module Mechany
  module Dsl
    class Reader
      attr_accessor :file_path

      def initialize(file_path)
        @file_path = file_path
      end

      def value(key)
        node = nodes.find {|p| p[key]}
        node[key] if node
      end

      def nodes 
        YAML.load_file(Dir.pwd + @file_path)
      end

      def xml
        file = File.read(Dir.pwd + @file_path)
      end
    end
  end
end
