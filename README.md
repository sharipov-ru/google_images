# GoogleImages

Simple Google Images API library for ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_images'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_images

## Usage

```ruby
ENV['GOOGLE_IMAGES_KEY'] = 'GOOGLE_API_KEY'
ENV['GOOGLE_IMAGES_CX'] = 'GOOGLE_SEARCH_CX'

GoogleImages.search('ruby')
GoogleImages.search('ruby', img_size: 'xlarge')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sharipov-ru/google_images. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

