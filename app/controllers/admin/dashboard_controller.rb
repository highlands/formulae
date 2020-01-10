class Admin::DashboardController < Admin::AdminController
  def show
    @forms = Form.all.order(updated_at: :desc)
  end
end
