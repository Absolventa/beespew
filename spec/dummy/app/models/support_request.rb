class SupportRequest < ActiveRecord::Base
  include Beespew::Model

  validates :subject, presence: true
end
