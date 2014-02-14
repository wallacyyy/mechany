module Dsl
  require 'yaml'
  require 'virtus'
  ##
  # Read YML properties files
  class Reader
    include Virtus.model

    # File path that the reader will read.
    attribute :file_path, String

    ##
    # Retrieves an value on the the yml root.
    def value(key)
      nodes[key]
    end

    ##
    # Retrieves all file keys
    def nodes 
      YAML.load_file(file_path)
    end

    ##
    # Read an xml file. Right now this method are reading any file type.
    def xml
      file = File.read(file_path)
      # Add remove line breaks here
    end
  end
end
