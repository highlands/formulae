# frozen_string_literal: true

class Authorization
  class << self
    def can_create_form?(api_key)
      api_key.creator?
    end

    def can_admin_form?(api_key); end

    def can_submit_form?(api_key)
      api_key.submitter?
    end

    def can_edit_form_submission?(api_key, application, form_id, form_submission_id); end
  end
end
