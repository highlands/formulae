# frozen_string_literal: true

class Section < ApplicationRecord
  belongs_to :form
  belongs_to :question
end
