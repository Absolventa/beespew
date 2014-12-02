require 'spec_helper'

describe Beespew do

  describe '.attribute' do
    it 'defaults to "beespew"' do
      expect(Beespew.attribute).to eql 'beespew'
    end
  end

  describe '.configure' do
    it 'yields itself' do
      expect { |b| Beespew.configure(&b) }.to yield_with_args(Beespew)
    end
  end

end
