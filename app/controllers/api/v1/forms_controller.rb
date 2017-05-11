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

  def create
    @form = Form.new(form_params)
    sections = params[:form][:sections]
    questions = params[:form][:questions]

    if @form.save!
      sections.each do |s|
        section = Section.create(
          name: s[:name],
          order: s[:order],
          content: s[:content],
          form: @form
        )
        @form.sections << section
        @form.save!
      end

      questions.each do |q|
        question = Question.create(
          key: q[:key],
          label: q[:label],
          content: q[:content],
          order: q[:order],
          question_type: q[:type]
        )
        @form.questions << question
        @form.save!
      end
      render json: @form, status: :created
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
    params.require(:form).permit(:application_id, :sections, :questions)
  end
end
