class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :signed_in, only: [:newpost]

  # GET /users/1
  # GET /users/1.json
  def show
    @stashes=Stash.where(user_id: @user.id).reverse_order
    @stash=Stash.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        render action: 'new'
      end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
