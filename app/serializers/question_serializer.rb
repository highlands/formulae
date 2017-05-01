# frozen_string_literal: true

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :key, :label, :content, :order, :hidden, :question_type, :validate_as
end
