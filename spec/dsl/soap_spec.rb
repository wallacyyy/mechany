require_relative '../spec_helper'

describe Dsl::Soap do

  it 'should return an array of yml allowed attributes' do
    expect(allowed_attributes).to be_kind_of(Array)
  end

end