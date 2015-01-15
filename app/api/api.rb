class API < Grape::API
  prefix 'api'
  format :json

  resource :todos do
    mount Todos::All
    mount Todos::Post
  end

  resource :sessions do
    mount Sessions::Sessions
  end
end
