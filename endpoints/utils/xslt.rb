module Endpoint
  module Utils
    require 'nokogiri'

    class Xslt 
      include Virtus.model

      attribute :xml, String
      attribute :xsl_path, String 

      def transform 
        reader = Dsl::Reader.new(file_path: xsl_path)
        xsl = reader.xml
        doc = Nokogiri::XML(xml)
        xslt = Nokogiri::XSLT(xsl)
        xslt.transform(doc)
      end

      def call
        transform.to_s
      end

    end
  end
end
