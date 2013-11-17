class IndexController < ApplicationController
  def index
    @title="Popular Stashes"
  	@stashes=Stash.order(score: :desc).limit(8)
  end

  def recent
    @title = "Recent Stashes"
    @stashes = Stash.order(created_at: :desc).limit(8)
    render 'index'
  end

end
