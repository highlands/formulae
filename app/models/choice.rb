# frozen_string_literal: true

class Choice < ApplicationRecord
  include Uuidable
  belongs_to :question

  include RailsSortable::Model
  set_sortable :order
end
