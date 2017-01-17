# frozen_string_literal: true
module Beespew
  module Model
    extend ActiveSupport::Concern

    included do
      attr_accessor Beespew.attribute
      validate :beespew_honeypot_must_be_blank
    end

    def spam?
      send(Beespew.attribute).present?
    end

    private

    def beespew_honeypot_must_be_blank
      errors.add(:base, 'spam protection in place') if spam?
    end

  end
end
