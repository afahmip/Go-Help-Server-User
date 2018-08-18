Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/get_users' => 'users#index', defaults: {format: :json}
  post '/get_user' => 'users#show', defaults: {format: :json}
  post '/create_user' => 'users#create', defaults: {format: :json}
  put '/update_user' => 'users#update', defaults: {format: :json}
  delete '/delete_user' => 'users#destroy', defaults: {format: :json}

  get '/get_user_requests' => 'user_requests#index', defaults: {format: :json}
  post '/get_user_request' => 'user_requests#show', defaults: {format: :json}
  post '/create_user_request' => 'user_requests#create', defaults: {format: :json}
  delete '/delete_user_request' => 'user_requests#destroy', defaults: {format: :json}
  post '/accept_request' => 'user_requests#accept_request', defaults: {format: :json}
  post '/retrieve_request' => 'user_requests#retrieve_request', defaults: {format: :json}

end
