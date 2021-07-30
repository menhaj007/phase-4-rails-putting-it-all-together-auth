Rails.application.routes.draw do
  post '/signup', to: 'users#create'

  get '/recipes', to: 'recipes#index'

end
