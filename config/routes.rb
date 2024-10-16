Rails.application.routes.draw do
  get 'mypage' => 'users#mypage', as: 'mypage'
  get 'users/show'
  get 'users/edit'
  get 'users/unsubscribe'
  get 'reviews/new'
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/edit'
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
