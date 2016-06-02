require 'http'

module GoogleImages
  # Class which represent google_images gem's query API
  class Query
    SUPPORTED_API_PARAMS = [
      :c2coff,
      :cr,
      :date_restrict,
      :filter,
      :googlehost,
      :img_color_type,
      :img_dominant_color,
      :img_size,
      :img_type,
      :num,
      :rights,
      :safe
    ]

    attr_reader :search_term, :api_params

    # Initialize a new Query keeping only those api params which are supported
    #
    # @param [String] search_term 
    # @param [Hash] api_params 
    #
    # @return [GoogleImages::Query] query object
    def initialize(search_term, api_params = {})
      @search_term = search_term
      @api_params = supported_api_params(api_params)
    end

    private
    def supported_api_params(api_params)
      api_params.select { |key, _| SUPPORTED_API_PARAMS.include?(key) }
    end
  end
end
