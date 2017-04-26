# frozen_string_literal: true

FactoryGirl.define do
  factory :form do
    association :application, factory: :application, strategy: :build
  end
end
