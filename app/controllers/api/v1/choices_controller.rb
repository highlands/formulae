# frozen_string_literal: true

class Api::V1::ChoicesController < Api::V1::ApiController
  before_action :find_choice, only: %i[show destroy update]

  def index
    @choices = Choice.all
    render json: @choices
  end

  def show
    render json: @choice
  end

  def update
    if @choice.update_attributes(choice_params)
      render json: @choice, status: :ok
    else
      render json: @choice.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @choice.destroy
      render json: :no_content, status: :no_content
    else
      render json: @choice.errors, status: :unprocessable_entity
    end
  end

  private

  def find_choice
    @choice = Choice.find(params[:id])
  end

  def choice_params
    params.require(:choice).permit(:question_id,
                                   :question_dependency_id,
                                   :metadata,
                                   :maximum_chosen,
                                   :label)
  end
end
