# frozen_string_literal: true

class QuestionDependency < ApplicationRecord
  belongs_to :question
  has_many :choices
end
