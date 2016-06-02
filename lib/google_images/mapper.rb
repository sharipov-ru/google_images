require 'google_images/image'
require 'google_images/errors/image_mapping_error'

module GoogleImages
  module Mapper
    def self.build_images(json)
      items = json['items']
      items.map { |item_hash| Image.new(item_hash) }
    rescue => e
      raise GoogleImages::Errors::ImageMappingError
    end
  end
end
