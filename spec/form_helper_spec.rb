describe Beespew::FormBuilder do
  let(:the_hive) { active_model.new }

  subject { described_class.new :hive, the_hive, template, {} }

  describe '#beespew_field' do
    it 'returns a text field with a default css class' do
      input = subject.beespew_field

      expected = '<input class="beespew" id="hive_beespew" name="hive[beespew]" type="text" />'
      expect(input).to eql expected
    end

    it 'returns a text field with a custom css class' do
      input = subject.beespew_field class: 'foobar'

      expected = '<input class="foobar" id="hive_beespew" name="hive[beespew]" type="text" />'
      expect(input).to eql expected
    end

    it 'obeyes the configured Beespew.attribute' do
      allow(Beespew).to receive(:attribute).and_return('sweetsformysweet')
      input = subject.beespew_field

      expected = '<input class="beespew" id="hive_sweetsformysweet" name="hive[sweetsformysweet]"'
      expect(input).to start_with expected
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
