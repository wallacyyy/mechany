require_relative '../spec_helper'

describe Dsl::Service do

  let(:path) { Dir.pwd + '/spec/fixtures/dsl/service.yml' }
  let(:reader) { Dsl::Reader.new(file_path: path) }
  let(:service) { Dsl::Service.new(reader: reader) }
  
  it 'request an service and read his nodes' do
    pending
  end

end
