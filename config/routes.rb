Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/get_users' => 'users#index', defaults: {format: :json}
  post '/get_user' => 'users#show', defaults: {format: :json}
  post '/create_user' => 'users#create', defaults: {format: :json}
  put '/update_user' => 'users#update', defaults: {format: :json}
  delete '/delete_user' => 'users#destroy', defaults: {format: :json}

  # scope '/retrieve_request' do
  #   post '/' => 'user_requests#filter_request'
  # end

end
