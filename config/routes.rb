Rails.application.routes.draw do

  resources :tasks, except: [:show] do
    collection do
      get :export_csv
    end
  end
  root 'tasks#index'

end
