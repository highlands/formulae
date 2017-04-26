# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:creator) }
    it { is_expected.to respond_to(:submitter) }
    it { is_expected.to respond_to(:analytics) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:application) }
  end
end
