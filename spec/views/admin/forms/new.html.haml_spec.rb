require 'rails_helper'

RSpec.describe "admin/forms/new", type: :view do
  before(:each) do
    assign(:admin_form, Admin::Form.new())
  end

  it "renders new admin_form form" do
    render

    assert_select "form[action=?][method=?]", admin_forms_path, "post" do
    end
  end
end
