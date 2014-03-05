require 'payu_api/gateway'

module PayuApi

  class Base
    include ::PayuApi::Gateway

    def initialize(basic_auth, format)
      @base = ''
      @basic_auth = basic_auth
      @format = format
    end

    def get(resource)
      options = {
        method: :get
      }
      send_request(plans_uri+"/#{resource}",options)
    end

    def create(body)
      body = data_format(body)
      options = {
        method: :post,
        body: body
      }
      send_request(plans_uri,options)
    end

    def update(resource, body)
      body = data_format(body)
      options = {
        method: :put,
        body: body
      }
      send_request(plans_uri+"/#{resource}",options)
    end

    def delete(resource)
      body = data_format(body)
      options = {
        method: :delete,
      }
      send_request(plans_uri+"/#{resource}",options)
    end

    def plans_uri
      PAYMENTS_API_URL + @base
    end

    def data_format(data)
      data = case @format
            when :json
              raise ArgumentError.new("#{data} is an invalid hash") unless data.kind_of? Hash
              data.to_json
            when :xml
              data.to_xml(root: @xml_root)
          end
      data
    end
  end
end
