# frozen_string_literal: true

require 'securerandom'

module Uuidable
  extend ActiveSupport::Concern

  included do
    before_create :set_id
    self.primary_key = 'id'

    # A hack to allow us to set initial ID with nested attributes
    def uuid=(uuid)
      self.id = uuid if uuid.present?
    end

    private def set_id
      self.id = SecureRandom.uuid unless id.present?
    end
  end
end
