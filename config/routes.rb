FakeBlockV2::Application.routes.draw do
  resources :blocks

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    resources :friends
  end

  resources :comments
end
