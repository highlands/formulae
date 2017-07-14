# frozen_string_literal: true

class QuestionDependencySerializer < ActiveModel::Serializer
  attributes :id, :question_id, :display, :and

  has_many :question_dependency_choices
end
