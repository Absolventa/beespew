module Beespew
  class FormBuilder < ActionView::Helpers::FormBuilder

    def beespew_field(options = {})
      options = { class: 'beespew' }.merge(options.with_indifferent_access)
      text_field Beespew.attribute, options
    end

    # def honeypot(*args)
    #   beespew_field *args
    # end

    alias honeypot beespew_field

  end
end
