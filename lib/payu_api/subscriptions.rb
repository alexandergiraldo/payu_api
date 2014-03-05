require 'payu_api/gateway'

module PayuApi

  class Subscriptions < PayuApi::Base

    def initialize(*options)
      super
      @base = '/subscriptions'
      @xml_root = 'subscription'
    end

    def add_recurring_bill(resource, body)
      body = data_format(body)
      options = {
        method: :put,
        body: body
      }
      send_request(plans_uri+"/#{resource}/recurringBillItems",options)
    end

    def plans_uri
      PAYMENTS_API_URL + @base
    end
  end
end
