require 'google_images/url_builder'
require 'google_images/network_requester'
require 'google_images/errors/response_parsing_error'

module GoogleImages
  class QueryExecutor
    # Execute the given query
    #
    # @param [GoogleImages::Query] query
    # @param [GoogleImages::Auth] auth
    # 
    # @raise [GoogleImages::Errors::URLGenerationError]
    # @raise [GoogleImages::Errors::NetworkError]
    # @raise [GoogleImages::Errors::ResponseParsingError]
    #
    # @return [Hash] response hash
    def self.run(query, auth)
      url = URLBuilder.build(query, auth)
      response = NetworkRequester.get(url)
      parse_json(response)
    end

    private
    def self.parse_json(response)
      JSON.parse(response)
    rescue JSON::ParserError
      raise GoogleImages::Errors::ResponseParsingError
    end
  end
end
