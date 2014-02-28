require_relative '../spec_helper'

describe Endpoint::Mailing::Delivery do

  let(:delivery) { Endpoint::Mailing::Delivery.new(from: 'from', to: 'to', subject: 'subject', body: 'body') }

  it 'sends an email with smtp' do
    mail = double('mail')
    expect(delivery).to receive(:mail).and_return(mail)
    expect(mail).to receive(:delivery_method).with(:smtp, delivery.smtp.attributes)
    expect(mail).to receive(:deliver)
    delivery.with_smtp
  end

  it 'sends an email with an test delivery method' do
    delivery.with_test
    expect(Mail::TestMailer.deliveries.length).to eq(1)
  end

end
