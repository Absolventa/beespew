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
      fill_honeypot!
      subject.valid?
      expect(subject.errors[:base]).to be_present
    end
  end

  describe '#spam?' do
    it 'returns false if honeypot is blank' do
      expect(subject).not_to be_spam
    end

    it 'returns true if honeypot is blank' do
      fill_honeypot!
      expect(subject).to be_spam
    end
  end

  def klass
    @klass ||= Class.new do
      include ActiveModel::Validations
      include Beespew::Model
    end
  end

  def fill_honeypot!
    subject.send("#{honeypot}=", 'some data')
  end

  def honeypot
    Beespew.attribute
  end
end
