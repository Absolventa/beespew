require 'beespew/model'

module Beespew

  mattr_accessor :attribute
  @@attribute  = 'beespew'.freeze

  def self.configure
    yield self
  end

end
