Rails.application.routes.draw do
  
  # Users routes
  get    'user/:user_id' => 'users#index'
  get    'users' => 'users#get'
  post   'user' => 'users#create'
  put    'user' => 'users#update'
  delete 'user' => 'users#delete'

end
