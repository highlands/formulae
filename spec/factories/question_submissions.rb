# frozen_string_literal: true

FactoryGirl.define do
  factory :question_submission do
    association :form_submission
    association :question
    string Faker::Lorem.word
  end
end
