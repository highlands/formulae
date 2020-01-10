require 'rails_helper'

RSpec.describe "Admin::Forms", type: :request do
  describe "GET /admin/forms" do
    it "works! (now write some real specs)" do
      get admin_forms_path
      expect(response).to have_http_status(200)
    end
  end
end
