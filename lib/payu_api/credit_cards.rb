require 'payu_api/gateway'

module PayuApi

  class CreditCards < PayuApi::Base

    def initialize(*options)
      super
      @base = '/creditCards'
      @xml_root = 'creditCard'
    end

    def plans_uri
      PAYMENTS_API_URL + @base
    end
  end
end
