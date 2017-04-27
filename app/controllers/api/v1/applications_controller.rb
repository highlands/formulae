# frozen_string_literal: true

class Api::V1::ApplicationsController < Api::V1::ApiController
  before_action :find_application, only: %i[show destroy]

  def index
    @applications = Application.all
    render json: @applications
  end

  def show
    render json: @application
  end

  def destroy
    if @application.destroy
      render json: :no_content, status: :no_content
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  private

  def find_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:id)
  end
end
