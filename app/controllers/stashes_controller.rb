class StashesController < ApplicationController
  def show
    @stash = Stash.find(params[:id])    
  end

  def search
  @results = Stash.search(params[:search])
end

def create
  @stash=current_user.stashes.create(:name=>params[:stash][:name], :user_id=>current_user.id, :score=>0, :comment=>"Edit to add a description.")
      if @stash.save
        flash[:notice]="Stash created!"
      else
        flash[:notice]="Error creating stash"
      end
        redirect_to :back
end

def newpost
  require 'mechanize'
  stash=Stash.find(params[:stash][:id])
  u = URI.parse(params[:url])

  if(!u.scheme)
    # prepend http:// and try again
    params[:url].prepend("http://")
      u = URI.parse(params[:url])
  end
if(%w{http https}.include?(u.scheme))
  title=Mechanize.new.get(u.to_s).title
      stash.posts.create(:url=>u.to_s, :title=>title)
      flash[:notice]="Post added to stash!"
      redirect_to :back
else
      flash[:notice]="Error reading URL!"
      redirect_to :back
end
  end

  def update
    @stash = Stash.find(params[:id])
      if @stash.update(stash_params)
        redirect_to @stash, notice: 'Stash was successfully updated.'
      else
        redirect_to @stash, notice: 'Error updating stash.'
      end
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

      # Never trust parameters from the scary internet, only allow the white list through.
    def stash_params
      params.require(:stash).permit(:name, :comment)
    end

end
