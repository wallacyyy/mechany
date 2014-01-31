require_relative '../spec_helper'

describe Dsl::Service do

  it 'returns an service' do
    expect(Dsl::Service.call(:mail)).to eq(Endpoint::Mailing::Delivery)
  end

end
