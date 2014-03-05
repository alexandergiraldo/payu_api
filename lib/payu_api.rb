require "payu_api/version"
require "base64"
require 'json'
require 'net/http'
require 'ostruct'
%w{ base plans customers credit_cards subscriptions recurring_bill_items }.each do |f|
  require "payu_api/#{f}"
end

module PayuApi
  TIME_OUT_LIMIT = 25

  class PayU
    attr_accessor :api_login, :api_key, :format

    def initialize(api_login, api_key, format = :json)
      @api_key = api_key
      @api_login = api_login
      @format = validate_format(format)
    end

    def basic_auth
      Base64.encode64("#{@api_login}:#{@api_key}")
    end

    def plans
      Plans.new(basic_auth, @format)
    end

    def customers
      Customers.new(basic_auth, @format)
    end

    def credit_cards
      CreditCards.new(basic_auth, @format)
    end

    def subscriptions
      Subscriptions.new(basic_auth, @format)
    end

    def recurring_bills
      RecurringBillItems.new(basic_auth, @format)
    end

    private
      def validate_format(format)
        #TODO xml support
        raise ArgumentError.new("#{format} is not a supported format") unless ['json'].include?(format.to_s)
        format.to_sym
      end
  end
end
