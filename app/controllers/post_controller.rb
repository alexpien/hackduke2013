class PostController < ApplicationController
  def create
  	post=Post.new(post_params)
        post.save

        return redirect_to "hoard/" + current_user.to_s
  end

  def post_params
    params.require(:post).permit(:url)
  end

end
