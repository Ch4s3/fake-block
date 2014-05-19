FakeBlockV2::Application.routes.draw do
  
  get "searches/search"

  resources :searches, :only => [:index]

  resources :blocks do
    member do
      put "upvote", to: "blocks#upvote"
      put "downvote", to: "blocks#downvote"
    end
  end

  root :to => "home#index"
  get 'friends_blocks' => "home#friends_blocks", :as => :sort
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    resources :friends
    resources :private_messages

    get '/received', to: 'private_messages#received'
    get '/sent', to: 'private_messages#sent'
    put '/mark_as_read', to: 'private_messages#mark_as_read'
    get '/opened', to: 'private_messages#opened'

  end

  resources :comments do
    member do
      put "upvote", to: "comments#upvote"
      put "downvote", to: "comments#downvote"
    end
  end
end
