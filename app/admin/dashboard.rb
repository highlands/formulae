# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { 'Formulae Admin API' } do
    span 'Welcome to the Formulae API'

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel 'Last Forms' do
          ul do
            Form.order(id: :asc).each do |form|
              li link_to(form.id, admin_form_path(form))
            end
          end
        end
      end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
