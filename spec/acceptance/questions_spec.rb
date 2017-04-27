# frozen_string_literal: true

require 'spec_helper'
require 'acceptance_helper'

resource 'Questions' do
  header 'Content-Type', 'application/json'

  let(:q) { FactoryGirl.create(:question) }

  get 'api/v1/forms/:form_id/questions' do
    example 'Listing Questions for a specific form' do
      do_request
      expect(status).to eq 200
    end
  end

  get 'api/v1/forms/:form_id/questions/:id' do
    let(:form_id) { q.form.id }
    let(:id) { q.id }

    example 'Getting a specific Question' do
      do_request

      response = JSON.parse(response_body)
      expect(response.keys).to eq %w[id key label content order hidden question_type validate_as]
      expect(response['id']). to eq q.id
      expect(response['key']). to eq q.key
      expect(response['label']). to eq q.label
      expect(response['content']). to eq q.content
      expect(response['order']). to eq q.order
      expect(response['hidden']). to eq q.hidden
      expect(response['question_type']). to eq q.question_type
      expect(response['validate_as']). to eq q.validate_as
      expect(status).to eq 200
    end
  end

  put 'api/v1/forms/:form_id/questions/:id' do
    let(:new_value) { 'updated' }
    let(:raw_post) do
      {
        question: {
          key: new_value
        }
      }.to_json
    end

    let(:form_id) { q.form.id }
    let(:id) { q.id }

    example_request 'Updating a question' do
      response = JSON.parse(response_body)
      expect(response['label']). to eq q.label
      expect(response['key']). to eq new_value
      expect(status).to eq(200)
    end
  end

  delete 'api/v1/forms/:form_id/questions/:id' do
    let(:form_id) { q.form.id }
    let(:id) { q.id }

    example_request 'Deleting a question' do
      expect(status).to eq(204)
    end
  end
end
