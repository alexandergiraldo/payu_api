require 'payu_api/gateway'

module PayuApi

  class Plans < PayuApi::Base
    include ::PayuApi::Gateway

    def initialize(basic_auth, format)
      super
      @base = '/plans'
      @xml_root = 'plan'
    end

    def plans_uri
      PAYMENTS_API_URL + @base
    end

  end
end
