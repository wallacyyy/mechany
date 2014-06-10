module Endpoint
  module Mailing
    require './endpoints/mailing/smtp'
    require 'mail'
    ##
    # Sends mails through the smtp configuration given destiny address.
    class Delivery
      include Virtus.model

      # Smtp configuration object.
      attribute :smtp, Endpoint::Mailing::Smtp, default: Endpoint::Mailing::Smtp.new

      # Mail content
      attribute :from, String
      attribute :to, String
      attribute :subject, String
      attribute :body, String
      attribute :method

      ##
      # Deliver mail with test method
      def with_test
        email = mail
        email.delivery_method(:test)
        email.deliver
      end

      ##
      # Apply the defined delivery method to the mail to be sent.
      # Why apply the delivery method here and not on some app initializer?
      # Because downtime on integration is not cool. 
      def with_smtp
        email = mail
        email.delivery_method(:smtp, smtp.attributes)
        email.deliver
      end

      ##
      # Delivers the mail given the basic mailing params with
      # the mail configurations.
      def mail
        Mail.new(from: from, to: to, subject: subject, body: body)
      end

      ##
      # Default method name convention to services
      def call 
        send("with_#{method.to_s}")
      end
    end
  end
end
