# frozen_string_literal: true

require 'spec_helper'
require 'acceptance_helper'

resource 'Form Submissions' do
  header 'Content-Type', 'application/json'

  let(:form_submission) { FactoryGirl.create(:form_submission) }
  let(:id) { form_submission.id }

  get '/api/v1/form_submissions/:id' do
    example 'Listing All Questions Submissions' do
      do_request
      expect(status).to eq 200
    end
  end

  get '/api/v1/form_submissions/:id' do
    example 'Getting a specific Form Submission' do
      do_request

      response = JSON.parse(response_body)
      expect(response.keys).to eq %w[id form]
      expect(response['id']). to eq form_submission.id
      expect(status).to eq 200
    end
  end

  post '/api/v1/form_submissions' do
    parameter :form_id, scope: :form_submission
    parameter :question_submissions, scope: :form_submission

    let(:question_submissions) { FactoryGirl.create_list(:question_submission, 3) }
    let(:new_form_submission) { FactoryGirl.create(:form_submission) }
    let(:form_id) { new_form_submission.form.id }

    example_request 'Creating a form submission' do
      response = JSON.parse(response_body)
      expect(response.keys).to eq %w[id form]
      expect(response['form']['application_id']).to eq new_form_submission.form.application_id
      expect(status).to eq(201)
    end
  end

  delete '/api/v1/form_submissions/:id' do
    example_request 'Deleting a form submission' do
      expect(status).to eq(204)
    end
  end
end
