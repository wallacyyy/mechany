require './spec/spec_helper'

describe Dsl::Service do

  let(:path) { '/spec/fixtures/dsl/service.yml' }
  let(:reader) { Dsl::Reader.new(path) }
  let(:service) { Dsl::Service.new(reader) }
  let(:http) { double('http') }
  let(:url) { 'http://httpbin.org/get' }
  let(:delivery) { double('delivery') }
  let(:mail) do
    { from: 'mrjonhs@email.com',
      to: 'mrbobs@email.com',
      subject: '$http',
      body: '$http',
      method: 'test' }
  end
  
  it 'saves an response in a service variable' do
    params =  { from: 'mrjonhs@email.com',
                to: 'mrbobs@email.com',
                subject: 'http_response',
                body: 'http_response',
                method: 'test' }

    expect(Endpoint::Http).to receive(:new).with(url: url).and_return(http)
    expect(http).to receive(:call).and_return('http_response')
    expect(Endpoint::Mailing::Delivery).to receive(:new).with(params).and_return(delivery)
    expect(delivery).to receive(:call)
    service.start
    expect(service.variables['$http']).to eq('http_response')
    service.terminate
  end

end
