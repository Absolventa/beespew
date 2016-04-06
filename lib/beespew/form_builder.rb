module Beespew
  class FormBuilder < ActionView::Helpers::FormBuilder

    def beespew_field(options = {})
      options = { class: 'beespew', placeholder: placeholder, tabindex: -1 }.
        merge(options.with_indifferent_access)
      text_field Beespew.attribute, options
    end

    alias honeypot beespew_field

    private

    def placeholder
      I18n.t "beespew.placeholder", default: 'If you are human, leave this blank'
    end

  end
end
