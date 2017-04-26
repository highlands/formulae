# frozen_string_literal: true

FactoryGirl.define do
  factory :section do
    name Faker::Lorem.word
    order 0
    content Faker::Lorem.sentence
    association :form, factory: :form, strategy: :build
  end
end
