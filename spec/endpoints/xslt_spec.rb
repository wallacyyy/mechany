require_relative '../spec_helper'

describe Endpoint::Utils::Xslt do

  let(:xml) { '<name>bob</name>' } 
  let(:xsl_path) { Dir.pwd + '/spec/fixtures/xslt/example.xsl' } 

  it 'apply an xsl to the xml content' do
    xslt = Endpoint::Utils::Xslt.new(xml: xml, xsl_path: xsl_path) 
    expect(xslt.transform.text).to eq('bob')
  end

end
