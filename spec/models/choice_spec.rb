# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Choice, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:label) }
    it { is_expected.to respond_to(:metadata) }
    it { is_expected.to respond_to(:maximum_chosen) }
    it { is_expected.to respond_to(:order) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:question) }
  end
end
