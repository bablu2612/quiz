class StudentsController < ApplicationController
    before_action :check_is_login
    def check_is_login
        if user_signed_in?
        else
        redirect_to user_session_path
        end
      end

    def index
        if current_user.role == "student"
            @types=Type.all
            render layout: "student"
          else
            redirect_to '/teacher'
          end
    end

    def show_quiz
        @questions = Question.where(type_of_quiz_id: params[:type_of_quiz])

        render layout: "student"

    end

    def result
        @notification=Notification.create title:"test" , descriptions: "test descriptions"
        i=1
        while(!params["selected_ans#{i}"].nil?)
            answer=params["selected_ans#{i}"].split(',')
            puts answer.to_json
        @quiz_res= QuizResult.new

            @question=Question.find(answer[1].to_i)
            @quiz_res.type_id=@question.type_of_quiz.type.id
            @quiz_res.question=@question.question
            @quiz_res.options=@question.options
            @quiz_res.correct_ans=@question.answer
            @quiz_res.submited_ans=answer[0]
            @quiz_res.notification_id=Notification.find(@notification.id)
            @quiz_res.save
            i=i+1
        end
       render json: {"message": "Quiz was submited successfully "}.to_json
    end
end
