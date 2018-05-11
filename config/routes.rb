Rails.application.routes.draw do
  resources :squad_dnas
  resources :squads do
    post 'import_squad_datum'
    post 'delete_squad_datum'
    post 'calculate_ratings'
    resources :squad_dnas
  end
  resources :squad_data
  get 'welcome/index'

  devise_for :users
  root 'welcome#index'

  get 'player/index'
	get 'player/indexsort'
  get 'player/indexdnasort'

  get 'player/show'
  post 'deletesquad' => 'player#deletesquad', as: :deletesquad

  post 'loadfiles' => 'player#loadfiles', as: :loadfiles
  post 'ratings' => 'player#ratings', as: :ratings
  post 'updatefiles' => 'player#updatefiles', as: :updatefiles

	post 'checkplayerratings' => 'player#checkplayerratings', as: :checkplayerratings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end