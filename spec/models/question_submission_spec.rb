# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionSubmission, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:string) }
    it { is_expected.to respond_to(:text) }
    it { is_expected.to respond_to(:boolean) }
    it { is_expected.to respond_to(:multi_select_id) }
    it { is_expected.to respond_to(:composite) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:form_submission) }
    it { is_expected.to belong_to(:question) }
  end

  describe 'when the question is string' do
    let(:question) do
      FactoryGirl.create(:question,
                         question_type: 'string',
                         content: 'question')
    end

    it 'returns the string as value' do
      qs = QuestionSubmission.new(string: question.content, question: question)
      expect(qs.value).to eq question.content
    end
  end

  describe 'when the question is multi_select' do
    let(:question) do
      FactoryGirl.create(:question,
                         question_type: 'multi_select',
                         content: 'question')
    end

    it 'returns the string as value' do
      qs = QuestionSubmission.new(string: question.content, question: question)
      expect(qs.value).to eq question.content
    end
  end

  describe 'validate max chosen' do
    let(:question) do
      q = FactoryGirl.create(:question)
      q.choices << FactoryGirl.create(:choice, label: 'YES', maximum_chosen: 1)
      q
    end

    it 'returns a validation error if max_chosen has been reached' do
      expect do
        QuestionSubmission.create(question: question, string: 'YES')
      end.not_to raise_error

      expect do
        QuestionSubmission.create!(question: question, string: 'YES')
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
