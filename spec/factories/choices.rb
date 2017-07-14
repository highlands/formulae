# frozen_string_literal: true

FactoryGirl.define do
  factory :choice do
    label Faker::Lorem.word
    association :question, factory: :question
    maximum_chosen 1
  end
end
