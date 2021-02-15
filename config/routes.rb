Rails.application.routes.draw do
  resources :tipo_servicos
  resources :servicos
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "servicos#index"
  get "servicos/list"
  get "servicos/geral"
end
