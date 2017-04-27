# frozen_string_literal: true

FactoryGirl.define do
  factory :question_dependency do
    association :question, factory: :question, strategy: :build
  end
end
