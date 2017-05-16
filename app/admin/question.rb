# frozen_string_literal: true

ActiveAdmin.register Question do
  permit_params :key,
                :label,
                :content,
                :order,
                :required,
                :hidden,
                :question_type,
                :validate_as,
                :section_id
end
