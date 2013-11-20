require_relative '../spec_helper'

describe Dsl::Reader do

  let(:path) { File.dirname(__FILE__) + '/../fixtures/config_sample.yml' }

  it 'returns a value from an yml file given the key' do
    reader = Dsl::Reader.new(file_path: path)
    value = reader.value('random_key')
    expect(value).to be_true
  end

end
