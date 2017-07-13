# frozen_string_literal: true

class Choice < ApplicationRecord
  include Uuidable
  belongs_to :question
  belongs_to :question_dependency
end
