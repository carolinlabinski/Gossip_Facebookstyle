class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    @author = User.find(params[:id])
  end

  def create

    @user = User.new(email: params[:email],password: params[:password],user_id:11)

    if @user.save
     redirect_to(root_path, notice: "User account successfully created!")
    else
     render '/users/new.html.erb'
    
   end
   end





  end
end
