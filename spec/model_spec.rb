require 'spec_helper'

describe Beespew::Model do

  subject { klass.new }

  describe 'honeypot accessor' do
    it { is_expected.to respond_to honeypot }
    it { is_expected.to respond_to "#{honeypot}=" }
  end

  context 'with validations' do
    it 'is valid if honeypot is blank' do
      subject.valid?
      expect(subject.errors[:base]).to be_blank
    end

    it 'is invalid if honeypot is set' do
      subject.send("#{honeypot}=", 'some data')
      subject.valid?
      expect(subject.errors[:base]).to be_present
    end
  end

  def klass
    @klass ||= Class.new do
      include ActiveModel::Validations
      include Beespew::Model
    end
  end

  def honeypot
    Beespew.attribute
  end
end
