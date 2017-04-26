# frozen_string_literal: true

class Section < ApplicationRecord
  belongs_to :form
  has_one :question
end
