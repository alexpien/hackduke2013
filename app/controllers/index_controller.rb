class IndexController < ApplicationController
  def index
  	@stashes=Stash.order(score: :desc)
  end

end
