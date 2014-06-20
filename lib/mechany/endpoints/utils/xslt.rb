module Mechany
  module Endpoint
    module Utils
      class Xslt 
        attr_accessor :xml, :xsl_path

        def initialize(options = {})
          @xml = options[:xml]
          @xsl_path = options[:xsl_path]
        end

        def transform 
          reader = Dsl::Reader.new(@xsl_path)
          xsl = reader.xml
          doc = Nokogiri::XML(@xml)
          xslt = Nokogiri::XSLT(xsl)
          xslt.transform(doc)
        end

        def call
          transform.to_s
        end
      end
    end
  end
end
