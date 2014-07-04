module Beespew
  module Model
    extend ActiveSupport::Concern

    included do
      attr_accessor Beespew.attribute
      validate :beespew_honeypot_must_be_blank
    end

    private

    def beespew_honeypot_must_be_blank
      if send(Beespew.attribute).present?
        errors.add(:base, 'spam protection in place')
      end
    end

  end
end
