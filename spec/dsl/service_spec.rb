require_relative '../spec_helper'

describe Dsl::Service do

  let(:path) { Dir.pwd + '/spec/fixtures/dsl/service.yml' }
  let(:reader) { Dsl::Reader.new(file_path: path) }
  let(:service) { Dsl::Service.new(reader: reader) }
  
  it 'saves an response in a service variable' do
    expect(Endpoint::Http).to receive(:new).with({'url' => 'http://httpbin.org/get'})
    expect(service.variables['$http']).to be_kind_of(String)
  end

end
