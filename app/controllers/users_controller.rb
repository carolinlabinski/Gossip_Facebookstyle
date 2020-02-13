class UsersController < ApplicationController
  
  def new
    @user = User.new
  end 
  
  
  def show
    @author = User.find(params[:id])
   end

   def create
    @user = User.new(email: params[:email], password: params[:password], city_id: 1)

    if @user.save
    session[:user_id] = @user.id
    redirect_to(root_path, notice: "Password successfully created!")
    else
    render(new_user_path) 
    end
  end

end
