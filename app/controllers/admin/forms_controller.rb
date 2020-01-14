class Admin::FormsController < Admin::AdminController
  before_action :set_admin_form, only: [:show, :edit, :update, :destroy]

  # GET /admin/forms
  # GET /admin/forms.json
  def index
    @forms = Form.all
  end

  # GET /admin/forms/1
  # GET /admin/forms/1.json
  def show
  end

  # GET /admin/forms/new
  def new
    @form = Form.new
  end

  # GET /admin/forms/1/edit
  def edit
  end

  # POST /admin/forms
  # POST /admin/forms.json
  def create
    @form = Form.new(admin_form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to [:admin, @form], notice: 'Form was successfully created.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/forms/1
  # PATCH/PUT /admin/forms/1.json
  def update
    respond_to do |format|
      if @form.update(admin_form_params)
        format.html { redirect_to [:admin, @form], notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/forms/1
  # DELETE /admin/forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to admin_forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_form_params
      params.require(:form).permit(:name, :description, :completion_content,
        section_attributes: [
          :id, :form_id, :name, :content, :order, :_destroy,
          question_attributes: [
            :id, :label, :content, :required, :order, :question_type,
            :validate_as, :placeholder, :section_id, :_destroy,
            choice_attributes: [
              :id, :question_id, :question_dependency_id, :metadata,
              :maximum_chosen, :label, :order, :_destroy
            ],
            question_dependency_attributes: [
              :id, :question_id, :display, :and, :_destroy
            ]
          ]
        ]
      )
    end
end
