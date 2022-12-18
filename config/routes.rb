Rails.application.routes.draw do
    
    root 'application#home'
    get '/hello' , to: 'application#hello'

    get '/about', to: 'pages#about'

    get 'signup', to: 'users#new'
    resources :users, except: [:new]
   
    resources :articles # REST: resources = CRUD + edit + new + index

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    resources :categories, except: [:destroy]

    # CRUD (Create, Read, Update, DELETE)

    # get '/articles', to 'articles#index'  # show all
    # post '/articles', to 'articles#create'  # create new row (C from CRUD)

    # get '/articles/new', to 'articles#new'
    # get '/articles/edit', to 'articles#edit'

    # get '/articles/:id', to: 'articles#show'  # show on row by id (R from CRUD)
    # put '/articles/:id', to 'articles#update'  # update one row by id (U from CRUD)
    # delete '/articles/:id', to 'articles#destroy'  # delete one row by id (D from CRUD)
end
