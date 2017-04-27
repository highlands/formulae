# frozen_string_literal: true

require 'spec_helper'
require 'acceptance_helper'

resource 'Choices' do
  header 'Content-Type', 'application/json'

  let(:choice) { FactoryGirl.create(:choice) }
  let(:question_id) { choice.question.id }
  let(:id) { choice.id }

  get '/api/v1/questions/:question_id/choices' do
    example 'Listing Choices for a specific question' do
      do_request
      expect(status).to eq 200
    end
  end

  get '/api/v1/choices/:id' do
    example 'Getting a specific Choice' do
      do_request

      response = JSON.parse(response_body)
      expect(response.keys).to eq %w[id question_id question_dependency_id
                                     metadata maximum_chosen label created_at updated_at]
      expect(status).to eq 200
    end
  end

  put '/api/v1/choices/:id' do
    let(:new_value) { 'label updated' }
    let(:raw_post) do
      {
        choice: {
          label: new_value
        }
      }.to_json
    end

    example_request 'Updating a Choice' do
      response = JSON.parse(response_body)
      expect(response['label']). to eq new_value
      expect(status).to eq(200)
    end
  end

  delete '/api/v1/choices/:id' do
    example_request 'Deleting a Choice' do
      expect(status).to eq(204)
    end
  end
end
