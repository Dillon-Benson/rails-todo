class API < Grape::API
  prefix 'api'
  format :json

  resource :todos do
    mount Todos::All
  end
end
