require_relative '../spec_helper'

describe Endpoint::Mail::Smtp do

  let(:mail) { Mail.new }
  let(:smtp) { Endpoint::Mail::Smtp.new }

  it 'returns the config path' do
    expect(smtp.config_path).to be_kind_of(String)
  end

end
