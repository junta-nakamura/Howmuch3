Rails.application.routes.draw do
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

    root to: "portfolios#top"
    resources :portfolios
    resources :companies, only: [:show, :edit, :update]
    resources :users, only: [:show, :edit, :update]
    
    resources :rooms, only: [:create,:show] do
      resources :messages, only: [:create]
      resources :company_messages, only: [:create]
    end
end
