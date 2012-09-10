module ZipFinder
  class Client
    extend Forwardable
    attr_accessor :http_adapter, :response_handler

    def self.get(zipcode)
      ZipFinder::Client.new.get(zipcode)
    end

    def initialize(http_adapter = RestClientAdapter, response_handler = ResponseHandler.new)
      @http_adapter = http_adapter
      @response_handler = response_handler
    end

    def get(zipcode)
      url = build_url(zipcode)
      response = http_adapter.http_get(url)
      response_handler.process(response)
    end

    private

    def build_url(zipcode)
      "#{ZipFinder::BASE_URL}/#{zipcode}"
    end
  end
end
