Rails.application.routes.draw do
	#the default index rote
	root :to => 'lists#index'

  resources :lists do
  	#removed show and index routes
  	resources :tasks, except => [:show, :index]
  end
end
