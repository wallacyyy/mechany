require_relative '../spec_helper'

describe Endpoint::Http do

  let(:url) { 'randomurl.com' }

  it 'sends an generic GET http request' do
    http = Endpoint::Http.new(url: url)
    expect(HTTParty).to receive(:get).with(url)
    http.get
  end

end
