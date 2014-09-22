Rails.application.routes.draw do
  root 'contacts#index'
  # match '/', {via: :get, to: 'contacts#index'}

  resources :contacts do
    resources :phones
  end

end
