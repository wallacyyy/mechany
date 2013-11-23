require_relative '../spec_helper'

describe Endpoint::Mailing::Smtp do

  let(:path) { Dir.pwd + '/spec/fixtures/config_sample.yml' }
  let(:smtp) { Endpoint::Mailing::Smtp.new(config_path: path) }

  it 'returns the config path' do
    expect(smtp.config_path).to be_kind_of(String)
  end

  it 'set the options that are on the config file' do
    smtp.set_options
    expect(smtp.address).to eq('1.3.3.7')
  end

end
