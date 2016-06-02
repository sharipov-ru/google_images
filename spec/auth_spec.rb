require 'spec_helper'

describe GoogleImages::Auth do
  it 'initializes new object' do
    auth = described_class.new('key', 'cx')

    expect(auth).to be_kind_of(described_class)
    expect(auth.key).to eq('key')
    expect(auth.cx).to eq('cx')
  end
end
