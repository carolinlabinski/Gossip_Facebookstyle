class SessionsController < ApplicationController
  
  def new
    user = User.new 
  end

    def create #authen
        user = User.find_by(email: params[:email])
        if user && user.authenticate(password: params[:password])
          session[:user_id] = user.id
          redirect_to root_path, notice: "Logged in!"
          #redirect_to(contact_path) 
          #redirect_to(root_path, notice: "User account successfully created!")
        else
          #render(new_user_path)
          redirect_to new_session_path, notice: "Not logged in!"
      end
    end

    def destroy #logout
      session.delete(:user_id)
      redirect_to :root, notice: "Logged out!"
    end
end
