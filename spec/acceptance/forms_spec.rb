# frozen_string_literal: true

require 'spec_helper'
require 'acceptance_helper'

resource 'Forms' do
  get 'api/v1/forms' do
    example 'Listing Forms' do
      do_request

      expect(status).to eq 200
    end
  end
end
