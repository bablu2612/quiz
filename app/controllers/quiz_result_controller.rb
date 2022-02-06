class QuizResultController < ApplicationController
    def index
        @notifications=Notification.order(created_at: :desc)
    end

    def show_result
        @notification=Notification.find(params[:id])
        @quiz_results= @notification.quiz_results
    end
end
