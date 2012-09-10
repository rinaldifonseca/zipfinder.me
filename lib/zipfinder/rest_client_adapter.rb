module ZipFinder
  class RestClientAdapter
    def self.http_get url, headers = {}
      response = RestClient.get(url, headers)
      OpenStruct.new(:status => response.code, :body => response.body)

    rescue RestClient::Exception, Errno::EINVAL, Errno::ECONNRESET, Errno::ECONNREFUSED, EOFError => e
      raise ServiceNotAvailableError, e.message
    end
  end
end
