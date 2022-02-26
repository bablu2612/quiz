class TypeOfQuizzesController < ApplicationController
  before_action :set_type_of_quiz, only: %i[ show edit update destroy ]

  # GET /type_of_quizzes or /type_of_quizzes.json
  def index
    @type_of_quizzes = TypeOfQuiz.where(quiz_id: params[:quiz_id]).order('updated_at DESC')
    @quiz = Quiz.find(params[:quiz_id])
    @class_name = @quiz.level.module_name.class_name.name
    @level_name = @quiz.level.name
    @module_name = @quiz.level.module_name.name
    @quiz_title = @quiz.title
  end

  # GET /type_of_quizzes/1 or /type_of_quizzes/1.json
  def show
  end

  # GET /type_of_quizzes/new
  def new
    @type_of_quiz = TypeOfQuiz.new
  end

  # GET /type_of_quizzes/1/edit
  def edit
  end

  # POST /type_of_quizzes or /type_of_quizzes.json
  def create
    @type_of_quiz = TypeOfQuiz.new(type_of_quiz_params)

    respond_to do |format|
      if @type_of_quiz.save
        format.html { redirect_to type_of_quizzes_path(quiz_id: @type_of_quiz.quiz_id), notice: "Type of quiz was successfully created." }
        format.json { render :show, status: :created, location: @type_of_quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_of_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_quizzes/1 or /type_of_quizzes/1.json
  def update
    respond_to do |format|
      if @type_of_quiz.update(type_of_quiz_params)
        format.html { redirect_to type_of_quizzes_path(quiz_id: @type_of_quiz.quiz_id), notice: "Type of quiz was successfully updated." }
        format.json { render :show, status: :ok, location: @type_of_quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_of_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_quizzes/1 or /type_of_quizzes/1.json
  def destroy
    @type_of_quiz.destroy

    respond_to do |format|
      format.html { redirect_to type_of_quizzes_url(quiz_id: @type_of_quiz.quiz_id), notice: "Type of quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_quiz
      @type_of_quiz = TypeOfQuiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_of_quiz_params
      params.require(:type_of_quiz).permit(:type_id, :name, :description, :quiz_id)
    end
end
