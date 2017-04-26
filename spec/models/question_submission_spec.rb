# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionSubmission, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:form_submission) }
    it { is_expected.to belong_to(:question) }
  end
end
