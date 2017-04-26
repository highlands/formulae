# frozen_string_literal: true

class QuestionSerializer < ActiveModel::Serializer
  attributes :key, :label, :content, :order, :hidden, :question_type, :validate_as
end
