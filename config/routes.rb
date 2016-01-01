Rails.application.routes.draw do

  resources :questions do
    resources :answers, except: :show
  end

  resources :comments, only: [:new, :create, :delete, :update]

end
