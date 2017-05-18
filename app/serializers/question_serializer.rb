# frozen_string_literal: true

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :key, :label, :content, :required, :order, :hidden, :question_type, :validate_as, :question_dependency

  def question_dependency
    { choices: object.question_dependency.choices } if object.question_dependency
  end

  # FIXME
  # has_one :question_dependency
end
