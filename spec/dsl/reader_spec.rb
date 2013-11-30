require_relative '../spec_helper'

describe Dsl::Reader do

  let(:config_sample) { File.dirname(__FILE__) + '/../fixtures/config_sample.yml' }
  let(:xml) { File.dirname(__FILE__) + '/../fixtures/requests/us_zip_request.xml' }


  it 'returns a value from an yml file given the key' do
    reader = Dsl::Reader.new(file_path: config_sample)
    value = reader.value('random_key')
    expect(value).to be_true
  end

  it 'returns an string from the xml file content' do
    reader = Dsl::Reader.new(file_path: xml)
    expect(reader.xml).to be_kind_of(String)
  end

end
