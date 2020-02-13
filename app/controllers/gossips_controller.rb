class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

  def index
  end

  def new
   @gossip=Gossip.new
  end

   def show
    @gossip = Gossip.find(params[:id])
   end

   def create
   @gossip = Gossip.new(title: params[:title],content: params[:content],user_id: current_user[:id])

  if @gossip.save
   redirect_to(root_path, notice: "Gossip successfully created!")
   else
   render '/gossips/new.html.erb'
 
  end
end

def edit
  @gossip = Gossip.find(params[:id])
  if current_user.id == @gossip.user.id
    @gossip = Gossip.find(params[:id])
  else
    redirect_to(gossip_path(params[:gossip_id]), notice: "Must be creator")
  end
end

def update
  @gossip = Gossip.find(params[:id])
  if current_user.id == @gossip.user.id
    if @gossip.update(title: params[:title], content: params[:content])
      redirect_to(root_path, notice: 'Gossip modified!')
    else
      render :edit
    end
  else
    redirect_to(gossip_path(params[:gossip_id]), notice: "Must be creator")
  end
end

def destroy
  @gossip = Gossip.find(params[:id])
  if current_user.id == @gossip.user.id
    @gossip.destroy
    redirect_to(root_path, notice: 'Gossip destroyed!')
  else
    redirect_to(gossip_path(params[:gossip_id]), notice: "Must be creator")
  end
end

def authenticate_user
  unless current_user
    redirect_to(new_session_path, notice: 'Must be connected')
  end
end

end
