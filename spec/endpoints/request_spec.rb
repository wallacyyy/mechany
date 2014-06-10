require './spec/spec_helper'

describe Endpoint::Soap::Request do

  let(:client) { double('client') }

  it 'sends an request through client' do
    wsdl = '#butatwhatcost'
    payload ='random request' 
    request = Endpoint::Soap::Request.new(wsdl: wsdl, operation: 'topsecret')
    allow(request).to receive(:file_path).and_return('praise_the_sun')
    allow(File).to receive(:read).and_return(payload)
    expect(Endpoint::Soap::Client).to receive(:new).with({ wsdl: wsdl }).and_return(client)
    expect(client).to receive(:instance).and_return(instance = double('instance'))
    expect(instance).to receive(:call).with(:topsecret, { xml: payload })
    request.result
  end
end
