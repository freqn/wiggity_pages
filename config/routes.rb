Rails.application.routes.draw do
  root 'contacts#index'
  # match '/', {via: :get, to: 'contacts#index'}

  resources :contacts do
    resources :phones, only: [:new, :create] # Nested route example
  end

  resources :phones, except: [:new, :create] # Unnested route example

  # match 'contacts', {via: :get, to: 'contacts#index'}
  # match 'contacts', {via: :post, to: 'contacts#create'}
  # match 'contacts/new', {via: :get, to: 'contacts#new'}
  # match 'contacts/:id', {via: :get, to: 'contacts#show'}
  # match 'contacts/:id/edit', {via: :get, to: 'contacts#edit'}
  # match 'contacts/:id', {via: [:patch, :put], to: 'contacts#update'}
  # match 'contacts/:id', {via: :delete, to: 'contacts#destroy'}

  # match 'contacts/:contact_id/phones/new', {via: :get, to: 'phones#new'}
  # match 'contacts/:contact_id/phones', {via: :post, to: 'phones#create'}

  # match 'contacts/:contact_id/phones/:id/edit', {via: :get, to: 'phones#edit'}
  # match 'contacts/:contact_id/phones/:id', {via: [:patch, :put], to: 'phones#update'}
  # match 'contacts/:contact_id/phones/:id', {via: :delete, to: 'phones#destroy'}

end
