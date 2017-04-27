# frozen_string_literal: true

require 'spec_helper'
require 'acceptance_helper'

resource 'Sections' do
  header 'Content-Type', 'application/json'

  let(:section) { FactoryGirl.create(:section) }
  let(:id) { section.id }

  get 'api/v1/sections/:id' do
    example 'Listing Sections' do
      do_request
      expect(status).to eq 200
    end
  end

  get 'api/v1/sections/:id' do
    example 'Getting a specific Section' do
      do_request

      response = JSON.parse(response_body)
      expect(response.keys).to eq %w[id form_id name order content created_at updated_at]
      expect(status).to eq 200
    end
  end

  put 'api/v1/sections/:id' do
    let(:new_value) { 'name updated' }
    let(:raw_post) do
      {
        section: {
          name: new_value
        }
      }.to_json
    end

    example_request 'Updating a Section' do
      response = JSON.parse(response_body)
      expect(response['name']). to eq new_value
      expect(status).to eq(200)
    end
  end

  delete 'api/v1/sections/:id' do
    example_request 'Deleting a Section' do
      expect(status).to eq(204)
    end
  end
end
