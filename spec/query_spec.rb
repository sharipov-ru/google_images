require 'spec_helper'

describe GoogleImages::Query do
  let(:search_term) { 'ruby' }

  it 'initializes new object' do
    query = described_class.new(search_term, {})
    expect(query).to be_kind_of(described_class)
  end

  it 'initializes new object even when params are not provided' do
    query = described_class.new(search_term)
    expect(query).to be_kind_of(described_class)
  end

  it 'returns a search term' do
    query = described_class.new(search_term, {})
    expect(query.search_term).to eq(search_term)
  end

  it 'returns api params' do
    query = described_class.new(search_term, {})
    expect(query.api_params).to eq({})
  end

  it 'keeps supported parameters' do
    api_params = { img_size: 'xlarge' }
    query = described_class.new(search_term, api_params)

    expect(query.api_params).to eq(api_params)
  end

  it 'removes unsupported parameters' do
    api_params = { img_size: 'xlarge', wrong: 'yes' }
    query = described_class.new(search_term, api_params)

    expect(query.api_params).to eq({ img_size: 'xlarge' })
  end
end
