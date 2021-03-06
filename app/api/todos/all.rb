module Todos
  class All < Grape::API
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
    end

    desc 'Returns all todos.'
    get :all do
      current_user.todos.all.to_json
    end
  end
end
