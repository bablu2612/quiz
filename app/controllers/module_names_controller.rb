class ModuleNamesController < ApplicationController
  before_action :set_module_name, only: %i[ show edit update destroy ]

  # GET /module_names or /module_names.json
  def index
    @module_names = ModuleName.where(class_name_id: params[:class_name_id])
    @class_name = ClassName.find(params[:class_name_id]).name
  end

  # GET /module_names/1 or /module_names/1.json
  def show
  end

  # GET /module_names/new
  def new
    @module_name = ModuleName.new
  end

  # GET /module_names/1/edit
  def edit
  end

  # POST /module_names or /module_names.json
  def create
    # abort('here')
    @module_name = ModuleName.new(module_name_params)

    respond_to do |format|
      if @module_name.save
        format.html { redirect_to class_name_module_names_path(@module_name.class_name_id), notice: "Module was successfully created." }
        format.json { render :show, status: :created, location: @module_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @module_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /module_names/1 or /module_names/1.json
  def update
    respond_to do |format|
      if @module_name.update(module_name_params)
        format.html { redirect_to class_name_module_names_path(params[:class_name_id]), notice: "Module was successfully updated." }
        format.json { render :show, status: :ok, location: @module_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @module_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /module_names/1 or /module_names/1.json
  def destroy
    @module_name.destroy

    respond_to do |format|
      format.html { redirect_to request.referer, notice: "Module was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_module_name
      @module_name = ModuleName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def module_name_params
      params.require(:module_name).permit(:name, :class_name_id)
    end
end
