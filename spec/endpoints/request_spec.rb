require_relative '../spec_helper'

describe Endpoint::Soap::Request do

  let(:client) { double('client') }

  it 'sends an request through savon' do
    request = Endpoint::Soap::Request.new(client: client)
    expect(File).to receive(:read).and_return('random request')
    expect(client).to receive(:call)
    request.result
  end
end
