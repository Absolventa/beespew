require 'spec_helper'

describe Beespew do

  describe '.attribute' do
    it { expect(Beespew.attribute).to eql 'beespew' }
  end

end
