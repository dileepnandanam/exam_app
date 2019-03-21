Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :exams do
  	resources :subjects do
      resources :topics do
        resources :chapters do
          resources :questions do
            resources :answers
          end
        end
      end
  	end
  end
end
