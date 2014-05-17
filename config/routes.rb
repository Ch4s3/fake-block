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
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    resources :friends
    resources :private_messages

    get '/inbox', to: 'private_messages#inbox'
    get '/outbox', to: 'private_messages#outbox'
    put '/mark_as_read', to: 'private_messages#mark_as_read'
    get '/read', to: 'private_messages#read'
  end

  resources :comments do
    member do
      put "upvote", to: "comments#upvote"
      put "downvote", to: "comments#downvote"
    end
  end
end
