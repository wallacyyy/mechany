require_relative '../../spec_helper'

describe Endpoint::Soap::Request do

  let(:path) { File.dirname(__FILE__) + '/../../fixtures/requests/us_zip_request.xml' }
  let(:wsdl) { 'http://www.webservicex.net/uszip.asmx?WSDL' }
  let(:client) { Endpoint::Soap::Client.new(wsdl: wsdl) }

  it 'sends an request and retrieves the result' do
    savon_client = client.with_savon
    VCR.use_cassette('us_zip_response') do
      request = Endpoint::Soap::Request.new(file_path: path, client: savon_client)
      expect(request.result(:get_info_by_zip).doc.search("//CITY").text).to eq("Beverly Hills")
    end
  end

end
