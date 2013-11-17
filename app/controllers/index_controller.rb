class IndexController < ApplicationController
  def index
  	@stashes=Stash.order(:score)
  end

end
