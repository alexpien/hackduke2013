class PostController < ApplicationController
  def create
  	post=Post.new(post_params)
        post.save
        render :nothing=>true
  end

  def post_params
    params.require(:post).permit(:url)
  end

end
