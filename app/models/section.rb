# frozen_string_literal: true

class Section < ApplicationRecord
  include Uuidable
  belongs_to :form
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true

  include RailsSortable::Model
  set_sortable :order
end
