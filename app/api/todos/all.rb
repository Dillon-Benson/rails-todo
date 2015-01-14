module Todos
  class All < Grape::API
    desc 'Returns all todos.'
    get :all do
      Todo.all
    end
  end
end
