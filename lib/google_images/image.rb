module GoogleImages
  class Image
    attr_reader :title, :link, :context_link, :snippet, :mime, :byte_size,
                :thumbnail_link, :thumbnail_height, :thumbnail_width,
                :height, :width

    def initialize(items_hash = {})
      @title            = items_hash['title']
      @link             = items_hash['link']
      @context_link     = items_hash['image']['context_link']
      @snippet          = items_hash['snippet']
      @mime             = items_hash['mime']
      @height           = items_hash['image']['height']
      @width            = items_hash['image']['width']
      @byte_size        = items_hash['image']['byte_size']
      @thumbnail_link   = items_hash['image']['thumbnailLink']
      @thumbnail_height = items_hash['image']['thumbnailHeight']
      @thumbnail_width  = items_hash['image']['thumbnailWidth']
    end
  end
end
