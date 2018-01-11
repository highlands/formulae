# frozen_string_literal: true

ActiveAdmin.register Application do
  permit_params :id, :name, :created_at, :updated_at
end
