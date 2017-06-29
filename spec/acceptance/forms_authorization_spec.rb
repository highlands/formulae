# frozen_string_literal: true

require 'spec_helper'
require 'acceptance_helper'

resource 'Forms' do
  describe 'API KEY Creator' do
    let(:authorization) { nil }
    let!(:form_object) { FactoryGirl.create(:form, :with_questions_and_choices) }

    header 'Content-Type', 'application/json'
    header 'Authorization', :authorization

    context 'Without Authorization' do
      let(:api_key) { form_object.application.api_keys.first }
      let(:authorization) { "Bearer #{api_key.token}" }

      post '/api/v1/forms' do
        let(:new_form_object) { FormMethods.build_a_new_form }

        let(:form) { FormMethods.create_params_for(new_form_object) }

        parameter :form

        example_request 'Creating a Form' do
          response = JSON.parse(response_body)
          expect(response.keys).to eq %w[error]
          expect(response['error']).to eq "You don't have permission for creating."
          expect(status).to eq(401)
        end
      end
    end

    context 'With Authorization' do
      let(:api_key) { FactoryGirl.create(:api_key, :creator) }
      let(:authorization) { "Bearer #{api_key.token}" }

      post '/api/v1/forms' do
        let(:new_form_object) { FormMethods.build_a_new_form }

        before do
          new_form_object.application.api_keys << api_key
        end

        let(:form) { FormMethods.create_params_for(new_form_object) }

        parameter :form

        example_request 'Creating a Form' do
          response = JSON.parse(response_body)
          expect(response.keys).to eq %w[id application completion_content sections questions]
          expect(status).to eq(201)
        end
      end
    end
  end
end
