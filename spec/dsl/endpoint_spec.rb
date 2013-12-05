require_relative '../spec_helper'

describe Dsl::Endpoint do

  it 'returns an service' do
    expects(Dsl::Service.call(:mail)).to be_kind_of(Enpoint::Mailing::Delivery)
  end

end
