Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions, shallow: true do
    resources :answers, except: :show
  end

  resources :comments, except: [:index, :show]
end
