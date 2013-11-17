class PostController < ApplicationController
  def create
        post_params[:user_id]=current_user.id
  	post=Post.new(post_params)
        post.save
        render :nothing=>true
  end

  def post_params
    params.require(:post).permit(:url)
  end

end
