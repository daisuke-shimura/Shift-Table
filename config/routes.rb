Rails.application.routes.draw do

  get 'events/new'
  get "manager" => 'homes#top'
  devise_for :users
  #root to: 'homes#top'
  devise_scope :user do
    root "devise/sessions#new"
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :days, only: [:index, :show, :create, :destroy] do
    resource :mons, only: [:create, :destroy]
    resource :tues, only: [:create, :destroy]
    resource :weds, only: [:create, :destroy]
    resource :thus, only: [:create, :destroy]
    resource :fris, only: [:create, :destroy]
    resource :sats, only: [:create, :destroy]
    resource :events, only: [:new, :create, :destroy, :edit, :update]
    resources :jobs, only: [:new, :create, :update, :destroy, :edit] do
      resources :job_comments, only: [:create, :destroy, :edit, :update]
    end
  end
  get "past" => 'days#index2'

end
