# frozen_string_literal: true

class Choice < ApplicationRecord
  belongs_to :question
  belongs_to :question_dependency
end
