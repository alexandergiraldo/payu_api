module PayuApi

  module Gateway

    PAYMENTS_API_URL = "https://api.payulatam.com/payments-api/rest/v4.3"
    REPORTS_API_URL = "https://api.payulatam.com/reports-api/rest/v4.3"

    def send_request(url, options = {method: :get})
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = options[:use_ssl] || true
      http.verify_mode = options[:verify_mode] || OpenSSL::SSL::VERIFY_NONE
      http.read_timeout = TIME_OUT_LIMIT
      begin
        request = http.send_request(options[:method].upcase,uri.path,options[:body],headers)
      rescue SocketError => se
        puts "Got socket error: #{se}"
        request = OpenStruct.new({body: "Connection has failed", code: "0"})
      end

      begin
        response = parse_response_body(request.body)
      rescue Exception => e
        puts e.message
        response = request.body
      end

      { "status" => request.code, "response" => response }
    end

    def headers
      header = case @format
            when :json
              { 'Accept' => "application/json", 'Content-Type' => 'application/json; charset=utf-8', 'Authorization' => "Basic #{@basic_auth.to_s}" }
            when :xml
              { 'Accept' => "application/xml", 'Content-Type' => 'application/xml; charset=utf-8', 'Authorization' => "Basic #{@basic_auth.to_s}" }
          end

    end

    def parse_response_body(body)
      header = case @format
            when :json
              JSON.parse(body)
            when :xml
              body
          end

    end

  end
end