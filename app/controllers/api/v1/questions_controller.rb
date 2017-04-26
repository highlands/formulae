# frozen_string_literal: true

class Api::V1::QuestionsController < Api::V1::ApiController
  def index
    @questions = Question.all
    render json: @questions
  end

  def show
    @question = Question.find(params[:id])
    render json: @question
  end
end
