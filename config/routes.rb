Rails.application.routes.draw do


  resources :student_quizzes
  get 'all_students',to: 'student_quizzes#all_students'
  get 'assign_quiz', to: 'student_quizzes#assign_quiz'
  resources :class_names do
    resources :module_names do
      resources :levels 
    end
  end

  # resources :module_names
  # resources :levels
  # resources :class_names

  resources :image_uploads
  resources :questions
  resources :type_of_quizzes
  resources :quizzes
  get 'home', to: 'static_pages#home'
  get 'teacher', to: 'static_pages#show'

  get 'upload_detail', to: 'static_pages#upload_detail'


  
  root 'static_pages#home'
  # root 'devise/sessions#new'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  
  
  devise_for :views
  # devise_for :users
  get 'create_question',to: 'questions#create_question'
  post 'update_question', to:"questions#update_question"
  get 'students',to: 'students#index'
  get 'test_result' ,to: 'students#test_result'
  post '/type_of_quizzes/:id/upload',to: 'type_of_quizzes#upload'
  get 'show_quiz',to: 'students#show_quiz'
  post '/student/result',to: 'students#result'


  get '/quiz/result',to: 'quiz_result#index'
  get '/quiz/:id/result',to: 'quiz_result#index'
  get '/notification/:id/result',to: 'quiz_result#show_result'


  
  # result_notification


  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
