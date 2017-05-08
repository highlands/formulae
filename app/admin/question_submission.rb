# frozen_string_literal: true

ActiveAdmin.register QuestionSubmission do
  permit_params :form_submission_id,
                :question_id,
                :string,
                :text,
                :boolean,
                :multi_select_id
end
