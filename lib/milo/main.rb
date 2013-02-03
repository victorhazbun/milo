module Milo
  class Main
    attr_accessor :main_url
    attr_reader :response_raw, :response

    def initialize(key, options = {})
      @key = key
      @options = options
    end

    def main_url
      "https://api.x.com/milo/v3/"
    end

    def make_request(end_url)
      result_key = "&key=#{@key}"
      curl = Curl::Easy.perform(main_url + end_url + result_key)
      response = Response.new(curl)
      JSON.parse(response.body)
    end

    class Response
      attr_reader :status, :body, :headers_raw, :headers, :curl, :url

      def initialize(curl)
        @curl = curl
        @url = curl.url
        @status = curl.response_code
        @body = curl.body_str
        @headers_raw = curl.header_str
        parse_headers
      end

      def parse_headers
        hs={}
        return hs if headers_raw.nil? or headers_raw==""
        headers_raw.split("\r\n")[1..-1].each do |h|
#          Rails.logger.info h
          m=h.match(/([^:]+):\s?(.*)/)
          next if m.nil? or m[2].nil?
#          Rails.logger.info m.inspect
          hs[m[1]]=m[2]
        end
        @headers=hs
      end
    end

    include Milo::Product
  end
end
