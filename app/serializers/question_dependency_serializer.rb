# frozen_string_literal: true

class QuestionDependencySerializer < ActiveModel::Serializer
  has_many :question_dependency_choices
end
