# frozen_string_literal: true

class FormSerializer < ActiveModel::Serializer
  attributes :id, :application, :sections, :questions
end
