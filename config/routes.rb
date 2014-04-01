FakeBlock::Application.routes.draw do
  resources :blocks

  devise_for :users
  root to: "home#index"
  
end
