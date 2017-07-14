class QuestionDependencyChoice < ApplicationRecord
  include Uuidable
  belongs_to :choice, required: false
  belongs_to :question_dependency
end
