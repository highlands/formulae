# frozen_string_literal: true

class Form < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :questions, through: :sections
  belongs_to :application
end
