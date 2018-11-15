Rails.application.routes.draw do
  get '/', to: 'static#index'
  get 'geek', to: 'static#geek'
  get 'meaubeuge', to: 'static#meaubeuge'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :images
end
