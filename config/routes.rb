Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :exams do
  	get :random_questions, on: :collection
  	get :progress, on: :collection
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
  resources :answers do
    post :skip, on: :collection
  end
end
