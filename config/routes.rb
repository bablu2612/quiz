Rails.application.routes.draw do
  resources :questions
  resources :type_of_quizzes
  resources :quizzes
  get 'home', to: 'static_pages#home'
  devise_for :views
  devise_for :users
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
