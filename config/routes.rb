Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'pages#home'
	get 'about', to: 'pages#about'
	resources :articles

	get 'signup', to: 'users#new'
	resources :users, execpt: %i[new]

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	#post 'users', to: 'users#create'
end
