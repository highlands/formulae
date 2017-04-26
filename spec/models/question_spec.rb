# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:label) }
    it { is_expected.to respond_to(:content) }
    it { is_expected.to respond_to(:hidden) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:section) }
  end
end
