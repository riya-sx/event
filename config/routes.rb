Rails.application.routes.draw do
  devise_for :users
  
  root 'events#index'
  
  resources :events, except: :index  do
    resources :tickets
  end  
  get '/showevents', to: "events#show_events"
end
