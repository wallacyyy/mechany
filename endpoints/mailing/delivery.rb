module Endpoint
  module Mailing
    require './endpoints/mailing/smtp'
    require 'mail'

    class Delivery
      attr_accessor :smtp, :from, :to, :subject, :body

      def initialize(options = {})
        @smtp = options[:smtp] || Endpoint::Mailing::Smtp.new
        @from = options[:from]
        @subject = options[:subject]
        @to = options[:to]
        @body = options[:body]
        @method = options[:method]
      end

      def with_test
        email = mail
        email.delivery_method(:test)
        email.deliver
      end

      def with_smtp
        email = mail
        email.delivery_method(:smtp, @smtp.as_hash)
        email.deliver
      end

      def mail
        Mail.new(from: @from, to: @to, subject: @subject, body: @body)
      end

      def call 
        send("with_#{method.to_s}")
      end
    end
  end
end
