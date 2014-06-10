require './spec/spec_helper'

describe Endpoint::Soap::Request do

  let(:path) { '/spec/fixtures/requests/us_zip_request.xml' }
  let(:wsdl) { 'http://www.webservicex.net/uszip.asmx?WSDL' }

  it 'sends an request and retrieves the result' do
    VCR.use_cassette('us_zip_response') do
      request = Endpoint::Soap::Request.new(file_path: path, wsdl: wsdl, operation: 'get_info_by_zip')
      expect(request.result.doc.search("//CITY").text).to eq("Beverly Hills")
    end
  end

end
