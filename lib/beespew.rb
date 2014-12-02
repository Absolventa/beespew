require 'beespew/model'

module Beespew
  autoload :FormBuilder, 'beespew/form_builder'

  mattr_accessor :attribute
  @@attribute  = 'beespew'.freeze

  def self.configure
    yield self
  end

end
