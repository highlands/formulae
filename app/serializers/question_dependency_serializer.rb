# frozen_string_literal: true

class QuestionDependencySerializer < ActiveModel::Serializer
  has_many :choices
end
