# frozen_string_literal: true

class Form < ApplicationRecord
  has_many :questions, through: :sections
  belongs_to :application
  has_many :sections
end
