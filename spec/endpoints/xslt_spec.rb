require './spec/spec_helper'

describe Endpoint::Utils::Xslt do

  let(:xml) { '<name>bob</name>' } 
  let(:xsl_path) { '/spec/fixtures/xslt/example.xsl' } 

  it 'apply an xsl to the xml content' do
    xslt = Endpoint::Utils::Xslt.new(xml: xml, xsl_path: xsl_path) 
    expect(xslt.transform.text).to eq('bob')
  end

end
