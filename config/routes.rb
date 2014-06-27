Rails.application.routes.draw do



  resources :restaurants, :only => [:index, :show] do

      resources :reservations, :only => [:show, :create, :edit, :destroy]
      resources :reviews, :only => [:create, :destroy, :show]

  end

  resources :sessions, :only => [:new, :create, :destroy]
  resources :users, :only => [:show, :new, :edit, :create, :destroy]

  root to: "welcome#index"
end
