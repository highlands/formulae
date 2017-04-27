# frozen_string_literal: true

class Api::V1::ApiKeysController < Api::V1::ApiController
  before_action :find_api_key, only: %i[show destroy update]

  def index
    @api_keys = ApiKey.all
    render json: @api_keys
  end

  def show
    render json: @api_key
  end

  def update
    if @api_key.update_attributes(api_key_params)
      render json: @api_key, status: :ok
    else
      render json: @api_key.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @api_key.destroy
      render json: :no_content, status: :no_content
    else
      render json: @api_key.errors, status: :unprocessable_entity
    end
  end

  private

  def find_api_key
    @api_key = ApiKey.find(params[:id])
  end

  def api_key_params
    params.require(:api_key).permit(:application_id,
                                    :creator,
                                    :submitter,
                                    :analytics)
  end
end
