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
    when 'address'
      composite
    end
  end

  def validate_max_chosen
    return if not_available_choices?
    return unless max_chosen
    # How much submitted + this one
    count = count_choice_submitted + 1

    errors.add(:MaxChosen, 'This choice is no longer available') if count > max_chosen
  end

  private def count_choice_submitted
    self.class.where(question: question).map { |qs| qs.value == value }.count
  end

  private def not_available_choices?
    choices = question.choices
    # If we don't have choices, we don't need to validate anything
    choices && choices.count.zero?
  end

  private def max_chosen
    # If we don't have max_chosen, we don't need to validate
    question.choices.select { |l| l.label == value }.first.try(:maximum_chosen)
  end
end
