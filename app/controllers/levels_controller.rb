class LevelsController < ApplicationController
  before_action :set_level, only: %i[ show edit update destroy ]

  # GET /levels or /levels.json
  def index
    @levels = Level.where(module_name_id: params[:module_name_id])
      @module_name = ModuleName.find(params[:module_name_id]).name
      @class_name = ClassName.find(params[:class_name_id]).name
  end

  # GET /levels/1 or /levels/1.json
  def show
  end

  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
  end

  # POST /levels or /levels.json
  def create
    @level = Level.new(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to class_name_module_name_levels_path, notice: "Level was successfully created." }
        format.json { render :show, status: :created, location: @level }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels/1 or /levels/1.json
  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to  class_name_module_name_levels_path(params[:class_name_id],params[:module_name_id]), notice: "Level was successfully updated." }
        format.json { render :show, status: :ok, location: @level }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1 or /levels/1.json
  def destroy
    @level.destroy

    respond_to do |format|
      format.html { redirect_to request.referer, notice: "Level was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def level_params
      params.require(:level).permit(:name, :module_name_id)
    end
end
