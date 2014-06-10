require './spec/spec_helper'

describe Dsl::Service do

  let(:http_url) { 'http://httpbin.org/ip' }
  let(:http_mail) { '/spec/fixtures/dsl/http_mail.yml' }
  let(:soap_xslt_soap) { '/spec/fixtures/dsl/soap_xslt_soap.yml' }
  let(:http_response) { "{\"origin\"=>\"179.210.222.223\"}" }

  before(:each) do
    Mail::TestMailer.deliveries.clear
  end

 it "makes a soap request, apply a xslt transformation and access another soap endpoint" do
   service = Dsl::Service.new(Dsl::Reader.new(soap_xslt_soap))
   VCR.use_cassette('soap_xslt_soap') do
     service.start
   end
   expect(service.variables['$result']).not_to be_nil
   service.terminate
 end

end
