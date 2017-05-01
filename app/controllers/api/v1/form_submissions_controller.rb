# frozen_string_literal: true

class Api::V1::FormSubmissionsController < Api::V1::ApiController
  before_action :find_form_submission, only: %i[show destroy update]

  def index
    @form_submisions = FormSubmissions.all
    render json: @form_submissions
  end

  def create
    @form_submission = FormSubmission.new(form_submission_params)

    if @form_submission.save
      render json: @form_submission, status: :created
    else
      render json: @form_submission.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @form_submission
  end

  def update
    if @form_submission.update_attributes(form_submission_params)
      render json: @form_submission, status: :ok
    else
      render json: @form_submission.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @form_submission.destroy
      render json: :no_content, status: :no_content
    else
      render json: @form_submission.errors, status: :unprocessable_entity
    end
  end

  private

  def find_form_submission
    @form_submission = FormSubmission.find(params[:id])
  end

  def form_submission_params
    params.require(:form_submission).permit(:form_id)
  end
end
