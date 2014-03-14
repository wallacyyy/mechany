require_relative '../spec_helper'

describe Endpoint::Soap::Request do

  let(:client) { double('client') }

  it 'sends an request through client' do
    wsdl = '#butatwhatcost'
    payload ='random request' 
    request = Endpoint::Soap::Request.new(wsdl: wsdl)
    expect(File).to receive(:read).and_return(payload)
    expect(Endpoint::Soap::Client).to receive(:new).with({ wsdl: wsdl }).and_return(client)
    expect(client).to receive(:instance).and_return(instance = double('instance'))
    expect(instance).to receive(:call).with(:operation, { xml: payload })
    request.result(:operation)
  end
end
