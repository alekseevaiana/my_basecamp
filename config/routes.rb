Rails.application.routes.draw do
  root to: "users#show"

  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users
  
  resources :users, except: [:edit, :update] do
    member do
      post "makeAdmin"
      post "removeAdmin"
    end
  end

  resources :projects do
    member do
      get "attachments"
      post "add_upload"
      post "destroy_upload"
      post "add_user"
    end

    resources :invitations, only: [:new, :create, :destroy]
    resources :discussions
  end
  
  resources :discussions do
    resources :comments do 
      post 'comments', to: 'comments#create'
    end
  end

  resources :chatrooms, only: [:index, :show]
  resources :chatmessages, only: [:create, :update, :delete, :edit]
  
  # mount ActionCable.server, at: "/cable"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end