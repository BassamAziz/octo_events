Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	resources :issues do
  		collection do
  			get :stats
  		end
    	resources :events, only: [:index]
    end
    resources :events, only: [:create]
end