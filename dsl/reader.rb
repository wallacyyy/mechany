module Dsl
  require 'yaml'
  require 'virtus'
  ##
  # Read YML properties files
  class Reader
    include Virtus.model

    # File path that the reader will read.
    attribute :file_path, String

    def value(key)
      file = YAML.load_file(file_path)
      file[key]
    end

    def xml
      file = File.read(file_path)
      # Add remove line breaks here
    end
  end
end
