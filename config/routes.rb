Rails.application.routes.draw do
  root 'pages#home'
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'
  get    '/freelancers',        to: 'freelancers#index'
  get    '/freelancers/:id',    to: 'freelancers#show', as: 'freelancer_profile'
  get    '/employers/:id',      to: 'employers#show', as: 'employer_profile'

  resources :messages do
    collection do
      resources :invitations, shallow: true do
        member do
          get '/accept',    to: 'invitations#accept'
          get '/decline',   to: 'invitations#decline'
        end
      end
      resources :applications, shallow: true do
        member do
          get '/accept',      to: 'applications#accept'
        end
      end
      resources :active_jobs, shallow: true do
        member do
          get '/complete',  to: 'active_jobs#complete'
        end
      end
      resources :completed_jobs
    end
  end
  resources :job_posts
  resources :users
end
