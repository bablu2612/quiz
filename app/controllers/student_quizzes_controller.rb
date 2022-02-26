class StudentQuizzesController < ApplicationController
  before_action :set_student_quiz, only: %i[ show edit update destroy ]

  # GET /student_quizzes or /student_quizzes.json
  def index
    @class_names = ClassName.all
  end

  def all_students
    @students = User.where(role: "student")
  end

  def assign_quiz
    student_previous_quiz = StudentQuiz.find_by_user_id(params[:user_id])
    unless student_previous_quiz.nil?
      student_previous_quiz.destroy
    end
    if params[:checked] == "true"      
      StudentQuiz.create(user_id: params[:user_id],class_name_id: params[:class_name_id])
    end
  end
  
  # GET /student_quizzes/1 or /student_quizzes/1.json
  def show
  end

  # GET /student_quizzes/new
  def new
    @student_quiz = StudentQuiz.new
  end

  # GET /student_quizzes/1/edit
  def edit
  end

  # POST /student_quizzes or /student_quizzes.json
  def create
    @student_quiz = StudentQuiz.new(student_quiz_params)

    respond_to do |format|
      if @student_quiz.save
        format.html { redirect_to student_quiz_url(@student_quiz), notice: "Student quiz was successfully created." }
        format.json { render :show, status: :created, location: @student_quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_quizzes/1 or /student_quizzes/1.json
  def update
    respond_to do |format|
      if @student_quiz.update(student_quiz_params)
        format.html { redirect_to student_quiz_url(@student_quiz), notice: "Student quiz was successfully updated." }
        format.json { render :show, status: :ok, location: @student_quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_quizzes/1 or /student_quizzes/1.json
  def destroy
    @student_quiz.destroy

    respond_to do |format|
      format.html { redirect_to student_quizzes_url, notice: "Student quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_quiz
      @student_quiz = StudentQuiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_quiz_params
      params.require(:student_quiz).permit(:user_id, :class_name_id)
    end
end
