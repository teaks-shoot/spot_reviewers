Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'mypage' => 'users#mypage', as: 'mypage'
  get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :reviews do
    resources :review_comments, only: [:create, :destroy]
  end
  
  get "search", to: "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
