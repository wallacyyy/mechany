require './spec/spec_helper'

describe Dsl::Reader do

  let(:config_sample) { '/spec/fixtures/config_sample.yml' }
  let(:xml) { '/spec/fixtures/requests/us_zip_request.xml' }


  it 'returns a value from an yml file given the key' do
    reader = Dsl::Reader.new(config_sample)
    value = reader.value('random_key')
    expect(value).to be_true
  end

  it 'returns an string from the xml file content' do
    reader = Dsl::Reader.new(xml)
    expect(reader.xml).to be_kind_of(String)
  end

  it 'gets all nodes from th yml file' do
    reader = Dsl::Reader.new(config_sample)
    expect(reader.nodes).to be_kind_of(Array)
    expect(reader.nodes.first).to be_kind_of(Hash)
  end

  it 'retrive an value from a node' do
    reader = Dsl::Reader.new(config_sample)
    expect(reader.value('node')).to eql({ 'property' => 'bob', 'another_property' => 'noel' }) 
  end 
    
end
