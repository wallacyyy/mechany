require './spec/spec_helper'

describe Endpoint::Mailing::Delivery do

  let(:params) { { from: 'from', to: 'to', subject: 'subject', body: 'body' } }
  let(:delivery) { Endpoint::Mailing::Delivery.new(params) }

  before(:each) do
    Mail::TestMailer.deliveries.clear
  end

  it 'sends an email with smtp' do
    mail = double('mail')
    expect(delivery).to receive(:mail).and_return(mail)
    expect(mail).to receive(:delivery_method).with(:smtp, delivery.smtp.as_hash)
    expect(mail).to receive(:deliver)
    delivery.with_smtp
  end

  it 'sends an email with an test delivery method' do
    delivery.with_test
    expect(Mail::TestMailer.deliveries.length).to eq(1)
  end

end
