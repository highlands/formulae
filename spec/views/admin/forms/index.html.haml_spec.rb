require 'rails_helper'

RSpec.describe "admin/forms/index", type: :view do
  before(:each) do
    assign(:admin_forms, [
      Admin::Form.create!(),
      Admin::Form.create!()
    ])
  end

  it "renders a list of admin/forms" do
    render
  end
end
