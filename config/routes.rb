# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :questions do
        resources :choices
      end

      resources :forms do
        resources :questions
      end
    end
  end
end
