Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create, :edit, :update] do
    resources :doses, only: [:new, :create]
  end
end
