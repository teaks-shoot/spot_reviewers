Rails.application.routes.draw do
  namespace :admin do
    get 'top', to: 'homes#top'
    resources :users, only: [:index, :show, :destroy]
    resources :reviews, only: [:index, :show, :destroy] do
      resources :review_comments, only: [:destroy]
    end
    resources :tags, only: [:create, :index, :edit, :update, :destroy]
  end
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
   devise_for :users, controllers: { 
     registrations: 'public/registrations',
     sessions: 'public/sessions'
   }

  scope module: :public do
    root to: "homes#top"
    get 'mypage' => 'users#mypage', as: 'mypage'
    get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :reviews do
      resources :review_comments, only: [:create, :destroy]
    end
    get "search", to: "searches#search"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
