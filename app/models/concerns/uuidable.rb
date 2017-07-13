require 'securerandom'

module Uuidable
  extend ActiveSupport::Concern

  included do
    #before_create :set_id

    # A hack to allow us to set initial ID with nested attributes
    def uuid=(uuid)
      self.id = uuid
    end

    private def set_id
      if attributes[:id] == nil
        attributes[:id] = SecureRandom.uuid
      end
    end
  end
end
