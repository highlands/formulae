# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin/manage', as: 'rails_admin'

  namespace :admin do
    root to: 'forms#index'
    resources :forms
  end

  namespace :api do
    namespace :v1 do
      resources :form_submissions
      resources :forms, shallow: true, except: %i[new edit] do
        resources :sections, except: %i[new edit] do
          resources :questions, except: %i[new create edit] do
            resources :choices, except: %i[new create edit]
          end
        end
      end
    end
  end
end
