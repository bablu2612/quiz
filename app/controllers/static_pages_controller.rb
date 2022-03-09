class StaticPagesController < ApplicationController
  before_action :check_is_login
  def check_is_login
      if user_signed_in?
      else
      redirect_to user_session_path
      end
    end
  def home
    @total_student=User.where(role: "student").count
    @total_quiz=Quiz.count
    @total_question=Question.count

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


  def upload_detail
    @typedetails=TypeOfQuiz.find(params[:quiz_id])
    @typename= @typedetails.type.name

    if @typename=="MCQ" || @typename=="Select one" || @typename=="Mid text Selector"
    @upload_details={
      "type" => @typename,
      "image_url" => "assets/uploadhelp/"+@typename+"1.png",
      "message" => 'questions ,correct-answer,option1,option2,sooo on in same format'
    }

  elsif @typename =="image question"
      @upload_details={
        "type" => @typename,
        "image_url" => "assets/uploadhelp/"+@typename+"1.png",
        "message" => 'questions ,correct-answer,image_url,option1,option2,sooo on in same format'
      }


  elsif @typename == "Written question"
    @upload_details={
      "type" => @typename,
      "image_url" => "assets/uploadhelp/"+@typename+"1.png",
      "message" => 'questions'
    }

  else
    @upload_details={
      "type" => @typename,
      "image_url" => "assets/uploadhelp/"+@typename+"1.png",
      "message" => 'questions ,correct-answer'
    }
  end

  end

end
