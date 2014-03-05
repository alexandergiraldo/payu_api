require 'payu_api/gateway'

module PayuApi

  class Subscriptions < PayuApi::Base

    def initialize(*options)
      super
      @base = '/subscriptions'
      @xml_root = 'subscription'
    end

    def plans_uri
      PAYMENTS_API_URL + @base
    end
  end
end
