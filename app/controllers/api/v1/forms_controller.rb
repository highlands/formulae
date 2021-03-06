# frozen_string_literal: true

class Api::V1::FormsController < Api::V1::ApiController
  before_action :find_form, only: %i[show destroy]
  before_action :can_create_form, only: :create

  def index
    @forms = @application.forms.all
    render json: @forms
  end

  def show
    render json: @form
  end

  def create
    @form = @application.forms.find_or_initialize_by(id: form_params[:id])
    if !@form.persisted?
      @form = @application.forms.new(form_params)
      render_create
    else
      render_update
    end
  end

  private def render_create
    if @form.save
      render json: @form, status: :created
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  private def render_update
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
    make_form_params
  end

  private def make_form_params
    # This make a standard for our form_params.
    # Here we are passing the correct parameter to work with nested_params and
    # we are permitting it to be used.
    permitted = params
                .require(:form)
                .permit(:id, :uuid, :completion_content, :application_id,
                        sections: [:id, :uuid, :form_id, :name, :order, :content, :_destroy,
                                   questions: [:id, :uuid, :key, :label, :content, :order, :hidden,
                                               :question_type, :validate_as, :section_id, :required,
                                               :placeholder, :_destroy,
                                               question_dependency: [
                                                 :id,
                                                 :and,
                                                 :display,
                                                 :_destroy,
                                                 :uuid,
                                                 question_dependency_choices: %i[
                                                   choice_id
                                                   id
                                                   uuid
                                                   _destroy
                                                 ]
                                               ],
                                               choices: [
                                                 :id,
                                                 :maximum_chosen,
                                                 :label,
                                                 :uuid,
                                                 :order,
                                                 :_destroy,
                                                 metadata: {}
                                               ]]])
    permitted[:sections_attributes] = permitted.delete(:sections)
    permitted[:sections_attributes].each do |section|
      section[:questions_attributes] = section.delete(:questions)
      section[:questions_attributes].each do |question|
        choices_attributes = question[:choices] ? question.delete(:choices) : []
        question[:choices_attributes] = choices_attributes
        question_dependency_attributes = question[:question_dependency] ? question.delete(:question_dependency) : nil
        next unless question_dependency_attributes
        question_dependency_choices_attributes = question_dependency_attributes[:question_dependency_choices] ? question_dependency_attributes.delete(:question_dependency_choices) : []
        question_dependency_attributes[:question_dependency_choices_attributes] = question_dependency_choices_attributes
        question[:question_dependency_attributes] = question_dependency_attributes
      end
    end
    permitted
  end

  def can_create_form
    can = Authorization.can_create_form?(@api_key)
    render json: { error: "You don't have permission for creating." }, status: 401 unless can
  end
end
