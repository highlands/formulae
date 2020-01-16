# frozen_string_literal: true

class Question < ApplicationRecord
  include Uuidable
  belongs_to :section
  has_many :question_submissions
  has_many :choices, dependent: :destroy
  has_one :question_dependency, required: false
  accepts_nested_attributes_for :choices, :question_dependency, allow_destroy: true

  delegate :form, to: :section

  include RailsSortable::Model
  set_sortable :order

  def choices_allowed?
    !%w{string text boolean address content}.include?(self.question_type)
  end
end
