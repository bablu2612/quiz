class ImageUploadsController < ApplicationController
  before_action :set_image_upload, only: %i[ show edit update destroy ]
  require 'roo'
  require 'spreadsheet'

  # GET /image_uploads or /image_uploads.json
  def index


    # @workbook = Spreadsheet.open(ImageUpload.last.upload_excel.to_file)
    
    # @worksheet = @workbook.worksheet(0)
    # abort('here')

    # sheet = Roo::Spreadsheet.open(url)
    @image_uploads = ImageUpload.all
  end

  # GET /image_uploads/1 or /image_uploads/1.json
  def show
  end

  # GET /image_uploads/new
  def new
    @image_upload = ImageUpload.new
  end

  # GET /image_uploads/1/edit
  def edit
  end

  # POST /image_uploads or /image_uploads.json
  def create
    # abort('here')
    @image_upload = ImageUpload.new(image_upload_params)

    type_name=TypeOfQuiz.find(params[:type_of_quiz]).type

    
   data= ImageUpload.import(params[:image_upload][:upload_excel])
  #  data.default_sheet = 'Sheet 3'

  question=params[:question]
  
  

  

   data.each_with_index do |hash,index|
    if index != 0
      option_start=2
      if type_name.name == "image question"
       question="#{hash[0]}@#{hash[2]}"
       option_start=3

      else
        question=hash[0]
      end
    correct_answer=hash[1]
    type_of_quiz=params[:type_of_quiz]
    options=[]
    if type_name.name != "Fill ups" || type_name.name != "Jumbled Words" ||type_name.name != "Written question"

      hash.each_with_index do |optiondata,index|
        if index >=option_start
          options<<optiondata
        end
      end
    
  end

      Question.create({question:question,options:options,answer:correct_answer,type_of_quiz_id:type_of_quiz})

    end
    




    # puts hash.inspect
    # debugger
    # => { id: 1, name: 'John Smith' }
  end
  
  redirect_to type_of_quizzes_path(quiz_id: TypeOfQuiz.find(params[:type_of_quiz]).quiz_id), notice: "Question was successfully added."

  end

  # PATCH/PUT /image_uploads/1 or /image_uploads/1.json
  def update
    respond_to do |format|
      if @image_upload.update(image_upload_params)
        format.html { redirect_to image_upload_url(@image_upload), notice: "Image upload was successfully updated." }
        format.json { render :show, status: :ok, location: @image_upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_uploads/1 or /image_uploads/1.json
  def destroy
    @image_upload.destroy

    respond_to do |format|
      format.html { redirect_to image_uploads_url, notice: "Image upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_upload
      @image_upload = ImageUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_upload_params
      params.require(:image_upload).permit(:name,:upload_excel)
    end
end
