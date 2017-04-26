# frozen_string_literal: true

class Api::V1::FormsController < Api::V1::ApiController
  def index
    @forms = Form.all
    render json: @forms
  end

  def show
    @form = Form.find(params[:id])
    render json: @form
  end
end
