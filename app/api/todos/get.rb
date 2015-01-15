module Todos
  class Get < Grape::API
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
      requires :access_token, type: String, desc: "Access token"
      requires :id, type: Integer, desc: "Id of Todo to get"
    end

    desc 'Returns a Todo by Id'
    get :get do
      current_user.todos.find_by(id: params[:id])
    end
  end
end
