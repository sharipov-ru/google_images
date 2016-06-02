module GoogleImages
  # A value-object which stores Google API authentication information
  class Auth
    attr_reader :key, :cx

    def initialize(key, cx)
      @key = key
      @cx = cx
    end
  end
end
