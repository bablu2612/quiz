class StudentsController < ApplicationController
    before_action :check_is_login
    before_action :set_class_name
    before_action :set_module_name,:set_level,:set_quiz,:set_type_of_quiz,only: %i[index test_result]
    before_action :set_path_name, only: %i[index test_result]
    skip_before_action :verify_authenticity_token
    @module_name 
    @level 
    @quiz
    def check_is_login
        if user_signed_in?
        else
        redirect_to user_session_path
        end
      end

    def index         
        set_module_name()
        if current_user.role == "student"
            render layout: "student"
        else
            redirect_to '/teacher'
        end
    end

    def show_quiz         
        set_module_name()
        unless StudentQuiz.where(user_id: current_user.id, class_name_id: @class_name.id).length == 0
            @questions = Question.where(type_of_quiz_id: params[:type_of_quiz]).shuffle()
            @duration = TypeOfQuiz.find(params[:type_of_quiz]).duration
        end
        render layout: "student"
    end

    def result
        @notification=Notification.create title:"test" , descriptions: "#{current_user.email} has given #{TypeOfQuiz.find(params[:type_of_quiz]).quiz.title}",user_id: current_user.id,type_id: TypeOfQuiz.find(params[:type_of_quiz]).type_id
        i=1
        @question = Question.where(type_of_quiz_id: params[:type_of_quiz])
        @question.each do |question|
            answer=params["selected_ans#{question.id}"].split(',')
            puts answer.to_json
            @quiz_res= QuizResult.new
            @quiz_res.type_id=question.type_of_quiz.type.id
            @quiz_res.question=question.question
            @quiz_res.options=question.options
            @quiz_res.correct_ans=question.answer
            @quiz_res.submited_ans=answer[0]
            @quiz_res.notification_id=Notification.find(@notification.id)
            @quiz_res.save
            i=i+1
        end
        redirect_to test_result_path(notification:@notification.id) 
    end 
    def test_result 
        quiz_result=Notification.find(params[:notification]).quiz_results    
        @score=0
        @result=Array.new   
        quiz_result.each_with_index  do |quiz,index|            
        
            if  quiz.correct_ans == quiz.submited_ans
                @result << ["Q#{index+1}","Correct"]
                @score = @score+1
            else
                @result<<["Q#{index+1}","Incorrect","Correct answer was #{quiz.correct_ans}"]
            end
        end
        render layout: 'student'
    end

    def set_class_name
        @student_quiz=StudentQuiz.find_by_user_id(current_user.id)
        unless @student_quiz.nil?
            @class_name = @student_quiz.class_name
        end
    end
 
    def set_module_name
        unless @class_name.nil?
            @module_names = @class_name.module_names
            unless params[:module_name_id].nil?
                $module_name=ModuleName.find(params[:module_name_id])
            else
                $module_name = @class_name.module_names.first
            end
            set_path_name()
            set_level()
        else
            $module_name=nil
        end
    end

    def set_level
        unless $module_name.nil?
            @levels=$module_name.levels
            unless params[:level_id].nil?
                $level=Level.find(params[:level_id])
            else
                $level = $module_name.levels.first
            end
            set_path_name()
            set_quiz()
        end
    end

    def set_quiz
        unless $level.nil?
            @quizzes=Quiz.where(level_id: $level.id)
            unless params[:quiz_id].nil?
                $quiz=Quiz.find(params[:quiz_id])
            else            
                $quiz=Quiz.where(level_id: $level.id).first
            end
            set_path_name()
            set_type_of_quiz()
        end
    end

    ### Method for Active Quiz Option
    # def set_quiz
    #     unless $level.nil?
    #         @quizzes=Quiz.where(level_id: $level.id, active: 1)
    #         unless params[:quiz_id].nil?
    #             $quiz=Quiz.find(params[:quiz_id])
    #         else            
    #             $quiz=Quiz.where(level_id: $level.id, active: 1).first
    #         end
    #         set_path_name()
    #         set_type_of_quiz()
    #     end
    # end

    def set_type_of_quiz
        @types=Type.all
        unless $quiz.nil?
            @type_of_quiz = TypeOfQuiz.where(quiz_id: $quiz)
        else
            @type_of_quiz = nil
        end
    end

    def set_path_name
        unless $module_name.nil?
            @module_name_name = $module_name.name
        else
            @module_name_name = nil
        end
        unless @class_name.nil?
            @class_name_name = @class_name.name
        end
        unless $level.nil?
            @level_name = $level.name
        else
            @level_name = nil
        end
        unless $quiz.nil?
            @quiz_title = $quiz.title
        else
            @quiz_title = nil
        end
    end

    
end
