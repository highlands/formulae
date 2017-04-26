# frozen_string_literal: true

FactoryGirl.define do
  factory :question do
    key Faker::Lorem.word
    label Faker::Lorem.word
    content Faker::Lorem.sentence
    question_type 'string'
    validate_as Faker::Lorem.word
    association :section, factory: :section, strategy: :build
  end
end
