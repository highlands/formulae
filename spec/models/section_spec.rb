# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Section, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:content) }
    it { is_expected.to respond_to(:order) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:form) }
    it { is_expected.to have_many(:questions) }
  end
end
