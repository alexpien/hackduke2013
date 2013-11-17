class IndexController < ApplicationController
  def index
  	@stashes=Stash.all.map{|x| x if x.posts.length>0}
  	@stashes.sort_by{|e| -e["score"]}
  end

end
