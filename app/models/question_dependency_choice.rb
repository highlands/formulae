class QuestionDependencyChoice < ApplicationRecord
  include Uuidable
  belongs_to :choice
  belongs_to :question_dependency
end
