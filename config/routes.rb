Rails.application.routes.draw do
  devise_for :users
  root to: "wins#index"

  resources :users, only: [:index, :destroy, :edit, :update]

  resources :auctions do
    resources :auctionproducts, shallow: true do
      resources :reviews
      resources :autobids
      resources :bids
    end
  end

  resources :auctionproducts, only: [:index] 

  resources :wins, only: [:index] do 
    get "/winningproducts", to: 'wins#win_product', on: :collection
  end

end