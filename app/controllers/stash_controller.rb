class StashController < ApplicationController
  def show
    @stash = Stash.find(params[:id])    
  end
end
