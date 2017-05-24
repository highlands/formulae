# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::FormSubmissionsController, type: :request do
  describe 'POST create' do
    context 'form submissions' do
      let!(:question_submissions) { FactoryGirl.build_list(:question_submission, 3) }
      let!(:new_form_submission) { FactoryGirl.build(:form_submission) }
      let(:form_id) { new_form_submission.form.id }

      it 'creates only one form submission' do
        expect do
          post api_v1_form_submissions_path,
               params: {
                 form_submission: { form_id: form_id,
                                    question_submissions: question_submissions }
               }
        end.to change { FormSubmission.count }.by(1)
      end
    end

    context 'when there is multi_select' do
      let!(:form) { FactoryGirl.create(:form) }
      let!(:question1) { FactoryGirl.create(:question, question_type: 'multi_select') }
      let(:question_submission1) { FactoryGirl.build(:question_submission, string: 'foo', question: question1) }
      let(:question_submission2) { FactoryGirl.build(:question_submission, string: 'bar', question: question1) }
      let(:question_submissions) do
        [question_submission1, question_submission2]
      end

      it 'creates question submissions for multi_select' do
        params_qs = question_submissions.map do |s|
          s.attributes.slice('question_id', 'string')
        end

        expect do
          post api_v1_form_submissions_path,
               params: {
                 form_submission: { form_id: form.id,
                                    question_submissions: params_qs }
               }
        end.to change { QuestionSubmission.count }.by(2)
        qs1, qs2 = QuestionSubmission.all
        expect(qs1.value).to eq('foo')
        expect(qs2.value).to eq('bar')
      end
    end

    context 'when there is no multi_select' do
      context 'question submissions' do
        let!(:form) { FactoryGirl.create(:form) }
        let!(:question1) { FactoryGirl.create(:question, question_type: 'string') }
        let!(:question2) { FactoryGirl.create(:question, question_type: 'text') }
        let!(:question3) { FactoryGirl.create(:question, question_type: 'boolean') }
        let(:question_submission1) { FactoryGirl.build(:question_submission, string: 'foo', question: question1) }
        let(:question_submission2) { FactoryGirl.build(:question_submission, text: "foo\nbar", question: question2) }
        let(:question_submission3) { FactoryGirl.build(:question_submission, boolean: true, question: question3) }
        let(:question_submissions) { [question_submission1, question_submission2, question_submission3] }

        it 'creates question submissions' do
          params_qs = question_submissions.map do |s|
            s.attributes.slice('question_id', 'string', 'text', 'boolean')
          end

          expect do
            post api_v1_form_submissions_path,
                 params: {
                   form_submission: { form_id: form.id,
                                      question_submissions: params_qs }
                 }
          end.to change { QuestionSubmission.count }.by(3)
          qs1, qs2, qs3 = QuestionSubmission.all
          expect(qs1.value).to eq('foo')
          expect(qs2.value).to eq("foo\nbar")
          expect(qs3.value).to eq(true)
        end
      end
    end
  end
end
