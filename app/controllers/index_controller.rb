class IndexController < ApplicationController
  def index
  	@stashes=Stash.all.map{|x| x}.sort_by{|e| -e[:score]}
  end

end
