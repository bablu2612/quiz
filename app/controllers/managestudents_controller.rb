class ManagestudentsController < ApplicationController

    def index
        @students = User.where(role: "student")
        # render layout: "application"

    end

    def edit
        @student=User.find(params[:id])
    end

    def update 
        @student = User.find(params[:id])
        @student.update(email: params[:user][:email],password:params[:user][:password]) 
        redirect_to managestudents_path,notice: "password for #{@student.email} is updated"
    end 
end
