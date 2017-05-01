# frozen_string_literal: true

FactoryGirl.define do
  factory :form_submission do
    association :form, factory: :form, strategy: :build
  end
end
