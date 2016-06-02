require 'http'
require 'google_images/errors/network_error'

module GoogleImages
  # This class acts as a facade between http client library `http.rb` and
  # our source code for abstracting library's entities and exceptions and using
  # only needed part of the http client library API
  module NetworkRequester
    # Performs json GET request
    #
    # @param [String] url
    #
    # @example Get data from url
    #   NetworkRequester.get("http://url")
    #
    # @raise [GoogleImages::Errors::NetworkError]
    def self.get(url)
      HTTP.headers(accept: 'application/json').get(url)
    rescue => e
      raise GoogleImages::Errors::NetworkError, 'Network Error'
    end
  end
end
