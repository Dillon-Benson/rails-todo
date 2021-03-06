module Sessions
  class Sessions < Grape::API
    format :json
    prefix :api

    resource :sessions do

   desc "Authenticate user and return user object / access token"

   params do
     requires :email, type: String, desc: "User email"
     requires :password, type: String, desc: "User Password"
   end

   post do
     email = params[:email]
     password = params[:password]

     if email.nil? or password.nil?
       error!({error_code: 404, error_message: "Invalid Email or Password."},401)
       return
     end

     user = User.where(email: email.downcase).first
     if user.nil?
       error!({error_code: 404, error_message: "Invalid Email or Password."},401)
       return
     end

     if !user.valid_password?(password)
       error!({error_code: 404, error_message: "Invalid Email or Password."},401)
       return
     else
       user.authentication_token = SecureRandom.urlsafe_base64(32, false)
       user.save
       {status: 'ok', token: user.authentication_token}.to_json
     end
   end

   desc "Destroy the access token"
   params do
     requires :access_token, type: String, desc: "User Access Token"
   end
   delete ':access_token' do
     access_token = params[:access_token]
     user = User.where(authentication_token: access_token).first
     if user.nil?
       error!({error_code: 404, error_message: "Invalid access token."},401)
       return
     else
       user.authentication_token = nil
       user.save
       {status: 'ok'}
     end
   end
 end
end
end