class GossipsController < ApplicationController
   
  def new
   @gossip=Gossip.new
  end

   def show
    @gossip = Gossip.find(params[:id])
   end

def create
@gossip = Gossip.new(title: params[:title],content: params[:content],user_id:11)

 if @gossip.save
  redirect_to(root_path, notice: "Gossip successfully created!")
 else
  render '/gossips/new.html.erb'
 
end
end

end
