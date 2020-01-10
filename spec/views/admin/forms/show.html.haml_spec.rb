require 'rails_helper'

RSpec.describe "admin/forms/show", type: :view do
  before(:each) do
    @admin_form = assign(:admin_form, Admin::Form.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
