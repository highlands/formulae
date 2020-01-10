require 'rails_helper'

RSpec.describe "admin/forms/edit", type: :view do
  before(:each) do
    @admin_form = assign(:admin_form, Admin::Form.create!())
  end

  it "renders the edit admin_form form" do
    render

    assert_select "form[action=?][method=?]", admin_form_path(@admin_form), "post" do
    end
  end
end
