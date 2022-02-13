class QuizResultController < ApplicationController
    def index
        @notifications=Notification.order(created_at: :desc)
    end

    def show_result
        @notification=Notification.find(params[:id])
        @notification.update(readed: 1)
        @quiz_results= @notification.quiz_results

        @score=0
        @quiz_results.each_with_index  do |quiz,index|            
           
            if  quiz.correct_ans == quiz.submited_ans
                @score = @score+1
            end
        end

        @score_data="Total student points and performance #{@score}/#{@quiz_results.count}"
    end
end
