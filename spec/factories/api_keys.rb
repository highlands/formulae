# frozen_string_literal: true

FactoryGirl.define do
  factory :api_key do
    token 'TOKEN'
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
