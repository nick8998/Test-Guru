Rails.application.routes.draw do
  
  resources :tests do
    resources :questions, only: [:create, :new, :edit, :show, :update, :destroy], shallow: true
  end
end
