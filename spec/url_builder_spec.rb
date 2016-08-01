require 'spec_helper'

describe GoogleImages::URLBuilder do
  let(:auth)  { GoogleImages::Auth.new('secret_key', 'secret_cx') }
  let(:url_main_part) { 'https://www.googleapis.com/customsearch/v1?q=ruby&key=secret_key&cx=secret_cx&searchType=image&alt=json&safe=off' }

  context 'when there is no parameters' do
    let(:query) { GoogleImages::Query.new('ruby', {}) }

    it 'builds url with parameters' do
      url = described_class.build(query, auth)

      expect(url).to eq(url_main_part)
    end
  end

  context 'when there is optional parameters' do
    it 'adds safe parameter' do
      query = GoogleImages::Query.new('ruby', safe: 'high')
      url = described_class.build(query, auth)

      expect(url).to eq(
        'https://www.googleapis.com/customsearch/v1?q=ruby&key=secret_key&cx=secret_cx&searchType=image&alt=json&safe=high'
      )
    end

    it 'adds imgSize parameter' do
      query = GoogleImages::Query.new('ruby', img_size: 'xxlarge')
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&imgSize=xxlarge")
    end
    
    it 'adds imgType parameter' do
      query = GoogleImages::Query.new('ruby', img_type: 'clipart')
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&imgType=clipart")
    end
    
    it 'adds imgDominantColor parameter' do
      query = GoogleImages::Query.new('ruby', img_dominant_color: 'pink')
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&imgDominantColor=pink")
    end
    
    it 'adds imgColorType parameter' do
      query = GoogleImages::Query.new('ruby', img_color_type: 'gray')
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&imgColorType=gray")
    end
    
    it 'adds num parameter' do
      query = GoogleImages::Query.new('ruby', num: 5)
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&num=5")
    end

    it 'adds start parameter' do
      query = GoogleImages::Query.new('ruby', start: 5)
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&start=5")
    end
    
    it 'adds rights parameter' do
      query = GoogleImages::Query.new('ruby', rights: 'cc_noncommercial')
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&rights=cc_noncommercial")
    end
    
    it 'adds c2coff parameter' do
      query = GoogleImages::Query.new('ruby', c2coff: 1)
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&c2coff=1")
    end
    
    it 'adds cr parameter' do
      query = GoogleImages::Query.new('ruby', cr: 'countryCA')
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&cr=countryCA")
    end
    
    it 'adds filter parameter' do
      query = GoogleImages::Query.new('ruby', filter: 1)
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&filter=1")
    end
    
    it 'adds googlehost parameter' do
      query = GoogleImages::Query.new('ruby', googlehost: 'google.de')
      url = described_class.build(query, auth)

      expect(url).to eq("#{url_main_part}&googlehost=google.de")
    end
  end
end
