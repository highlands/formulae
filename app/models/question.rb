# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :section

  delegate :form, to: :section
end
