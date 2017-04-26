# frozen_string_literal: true

class QuestionSubmission < ApplicationRecord
  belongs_to :form_submission
  belongs_to :question
  has_many :multi_select, class_name: 'QuestionSubmission', foreign_key: 'multi_select_id'
end
