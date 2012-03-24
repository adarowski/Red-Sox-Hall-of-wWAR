BaseballHackDayPre::Application.routes.draw do
  root :to => 'players#index'

  resources :players, only: [:index, :show] do
    resources :seasons, only: [:index, :show]
  end

  resources :seasons, only: [:index, :show]
end
