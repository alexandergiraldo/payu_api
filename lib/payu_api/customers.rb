require 'payu_api/gateway'

module PayuApi

  class Customers < PayuApi::Base

    def initialize(*options)
      super
      @base = '/customers'
      @xml_root = 'customer'
    end

    def add_credit_card(customer_id, body)
      options = {
        method: :post,
        body: data_format(body)
      }
      send_request(plans_uri+"/#{customer_id}/creditCards",options)
    end

    def delete_credit_card(customer_id, credit_card_token)
      options = {
        method: :delete
      }
      send_request(plans_uri+"/#{customer_id}/creditCards/#{credit_card_token}",options)
    end

    def plans_uri
      PAYMENTS_API_URL + @base
    end
  end
end
