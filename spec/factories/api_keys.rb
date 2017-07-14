# frozen_string_literal: true

FactoryGirl.define do
  factory :api_key do
    association :application, factory: :application_without_key
    sequence(:token) { |n| "token-#{n}-#{n + 1}-#{n + 20}" }
  end

  trait :creator do
    creator true
  end

  trait :submitter do
    submitter true
  end

  trait :analytics do
    analytics true
  end
end
