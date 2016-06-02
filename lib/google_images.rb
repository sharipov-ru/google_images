require 'google_images/version'
require 'google_images/auth'
require 'google_images/query'
require 'google_images/query_executor'
require 'google_images/mapper'

# Namespace for classes and modules that handle Google Images search 
module GoogleImages
  # Google Images Lookup
  #
  # @param [String] text to perform search with
  # @param [Hash] options the options perform search with
  #
  # @example Search images by `ruby` keyword
  #   GoogleImages.search('ruby')
  #
  # @example Search images with keyword and optional parameters
  #   GoogleImages.search('ruby', img_size: 'large', safe: 'high')
  #
  # @raise [GoogleImages::Errors::GeneralError]
  # @raise [GoogleImages::Errors::NetworkError]
  # @raise [GoogleImages::Errors::URLGenerationError] 
  # @raise [GoogleImages::Errors::ResponseParsingError]
  # @raise [GoogleImages::Errors::ImageMappingError]
  #
  # @return [Array<GoogleImages::Image] array of found images
  def self.search(text, options = {})
    query = Query.new(text, options)
    images_hash = QueryExecutor.run(query, authentication)
    Mapper.build_images(images_hash)
  end

  private

  def self.authentication
    Auth.new(key, cx)
  end

  def self.key
    ENV['GOOGLE_IMAGES_KEY']
  end

  def self.cx
    ENV['GOOGLE_IMAGES_CX']
  end
end
