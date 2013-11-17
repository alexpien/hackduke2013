class IndexController < ApplicationController
  def index
  	@stashes=Stashes.all.sort_by{|e| -e[:score]}
  end

end
