class IndexController < ApplicationController
  def index
  	@stashes=Stash.all.map{|x| x}
  	@stashes.sort_by{|e| -e[:score]}
  end

end
