class SessionsController < ApplicationController
  
  def new
    user = User.new 
  end

    def create #authen
        user = User.find_by(email: params[:email])
        if user && user.authenticate(password: params[:password])
          session[:user_id] = user.id
          redirect_to(contact_path) 
          #redirect_to(root_path, notice: "User account successfully created!")
        else
          render(new_user_path)
      end
    end

    def destroy #logout
      session.delete(:user_id)
    end
end
