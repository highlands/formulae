# frozen_string_literal: true

ActiveAdmin.register Section do
  permit_params :form_id, :name, :order, :content
end
