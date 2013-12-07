Noticeboard::Application.routes.draw do
  resources :posts, only: [:index, :show, :new, :create]

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: "posts#index"
end
