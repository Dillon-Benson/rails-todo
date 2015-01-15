module Todos
  class Post < Grape::API
    before do
      error!("401 Unauthorized, 401") unless authenticated
    end

    helpers do
      def warden
        env['warden']
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @user = User.find_by(authentication_token: params[:access_token])
      end

      def current_user
        warden.user || @user
      end
    end
    
    params do
      requires :todo_title, type: String, desc: "Title of Todo"
      requires :todo_text, type: String, desc: "Text of Todo"
    end

    desc 'Post a new Todo'
    post :post do
      todo = Todo.create(todo_title: params[:todo_title], todo_text: params[:todo_text])
      todo.save
      current_user.todos << todo
      current_user.save
    end
  end
end
