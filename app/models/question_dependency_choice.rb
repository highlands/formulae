class QuestionDependencyChoice < ApplicationRecord
  belongs_to :choice
  belongs_to :question_dependency
end
