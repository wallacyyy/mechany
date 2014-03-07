require_relative '../../spec_helper'

describe Dsl::Service do

  let(:http_url) { 'http://httpbin.org/ip' }
  let(:path) { Dir.pwd + '/spec/fixtures/dsl/http_to_mail_service.yml' }
  let(:reader) { Dsl::Reader.new(file_path: path) }
  let(:http_response) { "{\"origin\"=>\"179.210.222.223\"}" }
  let(:service) { Dsl::Service.new(reader: reader) }

  before(:each) do
    Mail::TestMailer.deliveries.clear
  end

  after(:each) do
    service.terminate
  end

  it "makes a http request and send a mail with the content" do
    VCR.use_cassette('http_ip_get') do
      service.start
      mail = Mail::TestMailer.deliveries.first
      expect(mail.subject).to eq(http_response)
    end
  end

  it "makes a soap request, apply a xslt transformation and access another soap endpoint" do
    pending
  end

  it "access a RESTful api and send a mail with the content" do
    pending
  end

end
