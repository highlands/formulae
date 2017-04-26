# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionSubmission, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:string) }
    it { is_expected.to respond_to(:text) }
    it { is_expected.to respond_to(:boolean) }
    it { is_expected.to respond_to(:multi_select_id) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:form_submission) }
    it { is_expected.to belong_to(:question) }
  end
end
