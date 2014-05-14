FakeBlockV2::Application.routes.draw do
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
  end

  resources :comments do
    member do
      put "upvote", to: "comments#upvote"
      put "downvote", to: "comments#downvote"
    end
  end
end
