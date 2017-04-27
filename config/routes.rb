# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forms, shallow: true, except: %i[new create edit] do
        resources :sections, except: %i[new create edit] do
          resources :questions, except: %i[new create edit] do
            resources :choices, except: %i[new create edit]
          end
        end
      end
    end
  end
end
