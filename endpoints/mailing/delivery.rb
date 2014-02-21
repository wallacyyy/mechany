module Endpoint
  module Mailing
    require_relative 'smtp'
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

      ##
      # Apply the defined delivery method to the mail to be sent.
      # Why apply the delivery method here and not on some app initializer?
      # Because downtime on integration is not cool. 
      def with_smtp
        mail = mail(from, to, subject, body)
        mail.delivery_method(:smtp, smtp.attributes)
        mail.deliver
      end

      ##
      # Sets another delivery method to the mail
      def with_delivery_method(method)
        built_mail = mail
        built_mail.delivery_method(method.to_sym)
        built_mail.deliver
      end 

      ##
      # Delivers the mail given the basic mailing params with
      # the mail configurations.
      def mail
        mail = Mail.new(from: from, to: to, subject: subject, body: body)
      end

      ##
      # Default method name convention to services
      def call 
        mail
      end
    end
  end
end
