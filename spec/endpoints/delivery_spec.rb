require_relative '../spec_helper'

describe Endpoint::Mail::Delivery do

  let(:mail) { Mail.new }

  it 'sets the delivery method to the mail' do
    delivery = Endpoint::Mail::Delivery.new
    delivery.set_method(mail)
    expect(mail.delivery_method.settings[:address]).to eql('localhost')
  end

end
