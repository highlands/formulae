# frozen_string_literal: true

class Api::V1::FormSubmissionsController < Api::V1::ApiController
  before_action :find_form_submission, only: %i[show destroy update]

  def index
    @form_submisions = FormSubmissions.all
    render json: @form_submissions
  end

  def create
    ActiveRecord::Base.transaction do
      begin
        @form_submission = FormSubmission.new(form_id: form_submission_params[:form_id])
        if @form_submission.save!
          question_submissions = params[:form_submission][:question_submissions].values.flatten
          question_submissions.each do |qs|
            QuestionSubmission.create!({ form_submission: @form_submission }.merge(qs))
          end

          render json: @form_submission, status: :created
        else
          render json: @form_submission.errors, status: :unprocessable_entity
        end
      rescue => e
        render json: { error: e.message.to_s }, status: 500
      end
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
    params.require(:form_submission).permit(:form_id,
                                            question_submissions: Hash)
  end
end
