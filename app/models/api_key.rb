# frozen_string_literal: true

class ApiKey < ApplicationRecord
  belongs_to :application
end
