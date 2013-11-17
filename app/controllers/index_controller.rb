class IndexController < ApplicationController
  def index
  	@stashes=Stash.order(score: :desc).limit(8)
  end

end
