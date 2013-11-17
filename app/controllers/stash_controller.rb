class StashController < ApplicationController
  def show
    @stash = Stash.find(params[:id])    
  end


  def destroy
    stash = Stash.find(params[:id])
    response = {}
    if stash.user_id ==current_user.id
      stash.destroy
      stash.save
      response["deleted"]=true
      render json: response
    else
      response["deleted"]=false
      render json: response
    end
    
  end

end
