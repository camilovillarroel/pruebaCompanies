Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :companies do
    resources :complaints
    post '/complaints/:id', to: 'complaints#create', as: 'add_complaint'
  end

  root 'companies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
