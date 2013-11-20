module Endpoint
  module Mail
    require_relative 'smtp'
    ##
    # Sends mails through the smtp configuration given destiny address.
    class Delivery
      include Virtus.model

      # Smtp configuration object.
      attribute :smtp, Endpoint::Mail::Smtp.new

      ##
      # Apply the defined delivery method to the mail to be sent.
      # Why apply the delivery method here and not on some app initializer?
      # Because downtime on integration is not cool. Yeah, it's not.
      def delivery_method(mail)
        mail.delivery_method(:smtp, smtp.attributes)
      end

    end
  end
end
