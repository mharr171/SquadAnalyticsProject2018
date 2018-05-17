Rails.application.routes.draw do
  resources :feedback

  resources :squad_dnas
  resources :squads do
    post 'import_squad_datum'
    post 'delete_squad_datum'
    post 'calculate_ratings'
    resources :squad_dnas
    resources :player
  end
  resources :squad_data
  get 'welcome/index'
  devise_for :users
  root 'welcome#index'

  post 'deletesquad' => 'player#deletesquad', as: :deletesquad

  post 'loadfiles' => 'player#loadfiles', as: :loadfiles
  post 'ratings' => 'player#ratings', as: :ratings
  post 'updatefiles' => 'player#updatefiles', as: :updatefiles

	post 'checkplayerratings' => 'player#checkplayerratings', as: :checkplayerratings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
