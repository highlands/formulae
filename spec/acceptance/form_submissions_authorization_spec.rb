# frozen_string_literal: true

require 'spec_helper'
require 'acceptance_helper'

resource 'Form Submissions Authorization' do
  let(:authorization) { nil }

  header 'Content-Type', 'application/json'
  header 'Authorization', :authorization

  context 'With SUBMMITTER Api Key' do
    let(:form_submission) { FactoryGirl.create(:form_submission) }
    let(:api_key) { form_submission.form.application.api_keys.first }
    let(:authorization) { "Bearer #{api_key.token}" }
    let(:id) { form_submission.id }

    before do
      api_key.submitter = true
      api_key.save!
    end

    post '/api/v1/form_submissions' do
      parameter :form_id, scope: :form_submission
      parameter :question_submissions, scope: :form_submission

      before do
        f = Form.find(form_id)
        @q = f.questions.first
        @q.choices << Choice.create(label: 'yes', maximum_chosen: 3)
        @q.save!
      end

      let(:question_submissions) do
        question_submission_list = FactoryGirl.build_list(:question_submission, 1, question: @q, string: 'yes')
        desired_hash = {}
        question_submission_list.map do |qs|
          value = qs.slice(:question_id, :string, :text, :boolean)
          desired_hash[qs.question_id] = [value]
        end
        desired_hash
      end

      let(:new_form_submission) { FactoryGirl.create(:form_submission) }
      let(:form_id) { new_form_submission.form.id }

      example_request 'Creating a form submission' do
        response = JSON.parse(response_body)
        expect(response.keys).to eq %w[id form question_submissions]
        expect(response['form']['application_id']).to eq new_form_submission.form.application_id
        expect(status).to eq(201)
      end
    end
  end

  context 'Without SUBMMITTER Api Key' do
    let(:form_submission) { FactoryGirl.create(:form_submission) }
    let(:api_key) { form_submission.form.application.api_keys.first }
    let(:authorization) { "Bearer #{api_key.token}" }
    let(:id) { form_submission.id }

    before do
      api_key.submitter = false
      api_key.save!
    end

    post '/api/v1/form_submissions' do
      parameter :form_id, scope: :form_submission
      parameter :question_submissions, scope: :form_submission

      before do
        f = Form.find(form_id)
        @q = f.questions.first
        @q.choices << Choice.create(label: 'yes', maximum_chosen: 3)
        @q.save!
      end

      let(:question_submissions) do
        question_submission_list = FactoryGirl.build_list(:question_submission, 1, question: @q, string: 'yes')
        desired_hash = {}
        question_submission_list.map do |qs|
          value = qs.slice(:question_id, :string, :text, :boolean)
          desired_hash[qs.question_id] = [value]
        end
        desired_hash
      end

      let(:new_form_submission) { FactoryGirl.create(:form_submission) }
      let(:form_id) { new_form_submission.form.id }

      example_request 'Creating a form submission' do
        response = JSON.parse(response_body)
        expect(response.keys).to eq %w[error]
        expect(response['error']).to eq "You don't have permission to submit a form."
        expect(status).to eq(401)
      end
    end
  end
end
