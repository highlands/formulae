# frozen_string_literal: true

require 'spec_helper'
require 'acceptance_helper'

resource 'Forms' do
  let(:form) { Form.create(application_id: 1) }

  get 'api/v1/forms' do
    example 'Listing Forms' do
      do_request

      expect(status).to eq 200
    end
  end

  get 'api/v1/forms/:id' do
    let(:id) { form.id }

    example 'Getting a specific Form' do
      do_request

      expect(status).to eq 200
    end
  end
end
