Spree::Core::Engine.routes.draw do
  resources :sharedlists do
    member do
      get :share
      post :send_email
    end
  end
  resources :shared_products, only: [:create, :update, :destroy]
end
