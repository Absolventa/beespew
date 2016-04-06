describe Beespew::FormBuilder do
  let(:the_hive) { active_model.new }

  subject { described_class.new :hive, the_hive, template, {} }

  describe '#beespew_field' do
    it 'returns a text field with a default css class' do
      input = subject.beespew_field

      expect(input).to have_tag('input', with: { class: 'beespew', name: 'hive[beespew]' })
    end

    it 'returns a text field with a custom css class' do
      input = subject.beespew_field class: 'foobar'

      expect(input).to have_tag('input', with: { class: 'foobar' })
    end

    it 'obeyes the configured Beespew.attribute' do
      allow(Beespew).to receive(:attribute).and_return('sweetsformysweet')
      input = subject.beespew_field

      expect(input).to have_tag('input', with: { id: 'hive_sweetsformysweet', name: 'hive[sweetsformysweet]' })
    end

    context 'with placeholder' do
      it 'returns an English text by default' do
        text = "If you are human, leave this blank"
        expect(subject.beespew_field).to match "placeholder=\"#{text}\""
      end

      it 'overrides the placeholder' do
        input = subject.beespew_field placeholder: 'Leave this shizzle'
        expect(input).to match "placeholder=\"Leave this shizzle\""
      end

      context 'with internationalization' do
        before { I18n.locale = :de }
        after  { I18n.locale = :en }

        it 'uses a translated string' do
          text = "Dieses Feld bitte nicht beschriften"
          expect(subject.beespew_field).to match "placeholder=\"#{text}\""
        end
      end
    end

  end

  describe '#honeypot' do
    it 'is an alias for #beespew_field' do
      args = { hello: 'world' }
      expected = subject.beespew_field(args)
      expect(subject.honeypot(args)).to eql expected
    end
  end

  def active_model
    @klass ||= Class.new do
      include ActiveModel::Model
      include Beespew::Model
      attr_accessor :drones, :queen
    end
  end

  def template
    @template ||= begin
                    template = Object.new
                    template.extend ActionView::Helpers::FormHelper
                    template.extend ActionView::Helpers::FormOptionsHelper
                  end
  end
end
