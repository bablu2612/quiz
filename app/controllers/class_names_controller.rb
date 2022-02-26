class ClassNamesController < ApplicationController
  before_action :set_class_name, only: %i[ show edit update destroy ]

  # GET /class_names or /class_names.json
  def index
    @class_names = ClassName.all.order('created_at')
  end

  # GET /class_names/1 or /class_names/1.json
  def show
    redirect_to class_names_path
  end

  # GET /class_names/new
  def new
    @class_name = ClassName.new
  end

  # GET /class_names/1/edit
  def edit
  end

  # POST /class_names or /class_names.json
  def create
    @class_name = ClassName.new(class_name_params)

    respond_to do |format|
      if @class_name.save
        format.html { redirect_to class_names_path, notice: "Class name was successfully created." }
        format.json { render :show, status: :created, location: @class_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_names/1 or /class_names/1.json
  def update
    respond_to do |format|
      if @class_name.update(class_name_params)
        format.html { redirect_to class_name_url(@class_name), notice: "Class name was successfully updated." }
        format.json { render :show, status: :ok, location: @class_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_names/1 or /class_names/1.json
  def destroy
    @class_name.destroy

    respond_to do |format|
      format.html { redirect_to class_names_url, notice: "Class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_name
      @class_name = ClassName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_name_params
      params.require(:class_name).permit(:name)
    end
end
