module ZipFinder
  class ResponseHandler
    include Loggable
    attr_accessor :json_adapter

    def initialize(json_adapter = JSON)
      @json_adapter = json_adapter
    end

    def process(response)
      if response.status == 200
        json_adapter.parse response.body
      else
        log "ZipFinder::RequestFailedError : #{response.message}"
        raise RequestFailedError, response.message
      end
    end
  end
end
