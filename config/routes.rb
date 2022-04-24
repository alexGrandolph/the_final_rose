Rails.application.routes.draw do

  get '/bachelorettes/:id', to: 'bachelorettes/bachelorettes#show'

  get '/bachelorettes/:id/contestants', to: 'bachelorettes/contestants#index'

  get '/contestants/:id', to: 'contestants#show'

  get '/outings/:id', to: 'outings#show'
end
