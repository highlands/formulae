# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionDependency, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:display) }
    it { is_expected.to respond_to(:and) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:question) }
  end
end
