Rails.application.routes.draw do

  resources :image_uploads
  resources :questions
  resources :type_of_quizzes
  resources :quizzes
  get 'activate_quiz', to: 'quizzes#activate_quiz'
  get 'home', to: 'static_pages#home'
  get 'teacher', to: 'static_pages#show'
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
