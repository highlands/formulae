# frozen_string_literal: true

ActiveAdmin.register ApiKey do
  permit_params :application_id, :creator, :submitter, :analytics, :token
end
