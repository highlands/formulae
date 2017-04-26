# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Form, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:application) }
  end
end
