# frozen_string_literal: true

class FormSerializer < ActiveModel::Serializer
  attributes :id, :application

  has_many :sections
  has_many :questions
end
