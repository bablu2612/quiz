class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: %i{create}
  # GET /questions or /questions.json
  def index
    @questions = Question.where(type_of_quiz_id: params[:type_of_quiz])
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @type_of_quiz_name=TypeOfQuiz.find(params[:type_of_quiz]).type.name
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    # @question = Question.new(question_params)

    # respond_to do |format|
    #   if @question.save
    #     format.html { redirect_to question_url(@question), notice: "Question was successfully created." }
    #     format.json { render :show, status: :created, location: @question }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @question.errors, status: :unprocessable_entity }
    #   end
    # end

    question=params[:question]
    correct_answer=params[:correct_answer]
    type_of_quiz=params[:type_of_quiz]
    i=1
    options=[]
    while(!params["option#{i}"].nil?)
      options<<params["option#{i}"]
      i=i+1
    end
    Question.create({question:question,options:options,answer:correct_answer,type_of_quiz_id:type_of_quiz})
    redirect_to type_of_quizzes_path(quiz_id: TypeOfQuiz.find(type_of_quiz).quiz_id), notice: "Question was successfully added."
  end

  def create_question
    Question.all
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question, :options, :answer, :type_of_quiz_id)
    end
end
