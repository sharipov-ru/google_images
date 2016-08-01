require 'google_images/errors/url_generation_error'

module GoogleImages
  # Builds Google Images API - compatible URL
  class URLBuilder
    class << self
      API_URL = 'https://www.googleapis.com/customsearch/v1'

      def build(query, auth)
        "#{API_URL}?q=#{query.search_term}&#{api_keys(auth)}&#{parameters(query)}"
      rescue => e
        raise GoogleImages::Errors::URLGenerationError
      end
    
      private
      def api_keys(auth)
        "key=#{auth.key}&cx=#{auth.cx}"
      end

      def parameters(query)
        google_api_params = {
          searchType:       query.api_params[:search_type] || 'image',
          alt:              query.api_params[:alt] || 'json',
          safe:             query.api_params[:safe] || 'off',
          num:              query.api_params[:num] || nil,
          start:            query.api_params[:start] || nil,
          rights:           query.api_params[:rights] || nil,
          imgSize:          query.api_params[:img_size] || nil,
          imgType:          query.api_params[:img_type] || nil,
          imgDominantColor: query.api_params[:img_dominant_color] || nil,
          imgColorType:     query.api_params[:img_color_type] || nil,
          c2coff:           query.api_params[:c2coff] || nil,
          cr:               query.api_params[:cr] || nil,
          filter:           query.api_params[:filter] || nil,
          googlehost:       query.api_params[:googlehost] || nil
        }

        google_api_params.map do |key, value|
          value ? "#{key}=#{value}" : nil
        end.compact.join("&")
      end
    end
  end
end
