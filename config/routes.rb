Polo::Application.routes.draw do
  root 'homes#index'

  get '/roster', to: 'players#roster'
  get '/coaching_staff', to: 'coaches#coaching_staff'
  get '/schedule', to: 'tournaments#schedule'
  get '/photos', to: 'static#photos'
  get '/files', to: 'resources#files'


  get '/admin', to: 'players#index'

  scope :admin do
    resources :teams, except: [:show]
    resources :players, except: [:show]
    resources :coaches, except: [:show]
    resources :tournaments
    resources :games, except: [:show]
    resources :resources, except: [:show]
  end
end
