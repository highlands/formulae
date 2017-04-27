# frozen_string_literal: true

FactoryGirl.define do
  factory :choice do
    label Faker::Lorem.word
    association :question, factory: :question, strategy: :build
    association :question_dependency, factory: :question_dependency, strategy: :build
    maximum_chosen 1
  end
end
