# frozen_string_literal: true

class FormSubmission < ApplicationRecord
  include Uuidable
  belongs_to :form
end
