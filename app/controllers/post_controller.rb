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

  def destroy
    post = Post.find(params[:id])
    stash=Stash.find(post.stash_id)
    response = {}
    if stash.user_id ==current_user.id
      post.destroy
      post.save
      response["deleted"]=true
      render json: response
    else
      response["deleted"]=false
      render json: response
    end
    
  end


end
