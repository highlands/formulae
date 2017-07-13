# frozen_string_literal: true

class QuestionDependency < ApplicationRecord
  belongs_to :question
  has_many :question_dependency_choices
  accepts_nested_attributes_for :question_dependency_choices, allow_destroy: true
end
