# frozen_string_literal: true

class Api::V1::QuestionsController < Api::V1::ApiController
  before_action :find_question, only: %i[show destroy update]

  def index
    @questions = Question.all
    render json: @questions
  end

  def show
    render json: @question
  end

  def update
    if @question.update_attributes(question_params)
      render json: @question, status: :ok
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @question.destroy
      render json: :no_content, status: :no_content
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:key,
                                     :label,
                                     :content,
                                     :order,
                                     :hidden,
                                     :required,
                                     :question_type,
                                     :validate_as,
                                     :section_id)
  end
end
