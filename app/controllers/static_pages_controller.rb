class StaticPagesController < ApplicationController
  before_action :check_is_login
  def check_is_login
      if user_signed_in?
      else
      redirect_to user_session_path
      end
    end
  def home
    if current_user.role != "teacher"
      redirect_to '/students'
    end

  end

  def show
    if current_user.role == "student"
      redirect_to '/students'
    else
      render "home"
    end
    
  end


end
