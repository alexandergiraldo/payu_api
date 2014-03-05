require 'payu_api/gateway'

module PayuApi

  class RecurringBillItems < PayuApi::Base

    def initialize(*options)
      super
      @base = '/recurringBillItems'
      @xml_root = 'recurringBillItem'
    end

    def params(params = {})
      params = params_format(params)
      options = {
        method: :get
      }
      send_request(plans_uri+"/params?#{params}",options)
    end

    def plans_uri
      PAYMENTS_API_URL + @base
    end

    def params_format(data)
      raise ArgumentError.new("#{data} is an invalid hash") unless data.kind_of? Hash
      params = ""
      data.each do |k,v|
        params += "#{k}=#{v}&"
      end
      params
    end
  end
end
