# frozen_string_literal: true

require 'spec_helper'
require 'acceptance_helper'

resource 'Questions' do
  let(:question) { FactoryGirl.create(:question) }

  get 'api/v1/forms/:form_id/questions' do
    example 'Listing Questions for a specific form' do
      do_request

      expect(status).to eq 200
    end
  end

  get 'api/v1/forms/:form_id/questions/:id' do
    let(:form_id) { question.form.id }
    let(:id) { question.id }

    example 'Getting a specific Form' do
      do_request

      expect(status).to eq 200
    end
  end
end
