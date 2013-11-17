class StashController < ApplicationController
def show
	@posts=Post.where(stash_id: params[:id])
end
end
