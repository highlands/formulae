# frozen_string_literal: true

class QuestionSubmission < ApplicationRecord
  belongs_to :form_submission
  belongs_to :question
  has_many :multi_select, class_name: 'QuestionSubmission', foreign_key: 'multi_select_id'
  validate :validate_max_chosen

  def value
    case question.question_type
    when 'string'
      string
    when 'text'
      text
    when 'boolean'
      boolean
    when 'multi_select'
      string
    end
  end

  def validate_max_chosen
    # How much submitted + this one
    count = count_choice_submitted + 1
    choices = question.choices
    # If we don't have choices, we don't need to validate anything
    return if choices.count.zero?
    max_chosen = choices.select { |l| l.label == value }.first.maximum_chosen

    errors.add(:MaxChosen, 'This choice is no longer available') if count > max_chosen
  end

  private def count_choice_submitted
    self.class.where(question: question).map { |qs| qs.value == value }.count
  end
end
