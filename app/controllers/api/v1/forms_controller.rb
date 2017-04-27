# frozen_string_literal: true

class Api::V1::FormsController < Api::V1::ApiController
  before_action :find_form, only: %i[show destroy update]

  def index
    @forms = Form.all
    render json: @forms
  end

  def show
    render json: @form
  end

  def update
    if @form.update_attributes(form_params)
      render json: @form, status: :ok
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @form.destroy
      render json: :no_content, status: :no_content
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  private

  def find_form
    @form = Form.find(params[:id])
  end

  def form_params
    params.require(:form).permit(:application_id)
  end
end
