require_relative '../../spec_helper'

describe Endpoint::Http do

  let(:url) { 'http://httpbin.org/get' }

  it 'sends an generic GET http request' do
    VCR.use_cassette('http_get') do
      http = Endpoint::Http.new(url: url)
      response = http.get
      expect(response['url']).to eq(url)
      expect(response['origin']).to eq('179.210.222.223')
    end
  end

end
