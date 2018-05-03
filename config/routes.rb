Rails.application.routes.draw do
  get 'braintree/new'

  get 'welcome/index'

  resources :listings, controller: "listings"
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create,:profile] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

post 'braintree/checkout'

get "/reservation" => "reservations#index"
get "/listings/:id/reservation/new" => "reservations#new"
get "reservation/host" => "reservations#find"
post "/listings/:id/reservation/new" => "reservations#create"


post "/profile/edit" => "users#update"
get "/profile" => 'users#edit'
post "/listings/:id/preview" => "listings#preview"
get "/listings/:id/preview" => "listings#preview"
post "/listings/:id" => "listings#show"
post "/listings/:id/verify" => "listings#verify"
get "/auth/:provider/callback" => "sessions#create_from_omniauth"
##this is to link to google for sign in with google
root to: "home#index"
##this is to point the rootpage to view/home/index.. every time to create a view, need to create a controller. 
##home is the class while index is the method. the naming should be the same for the views folder
end
