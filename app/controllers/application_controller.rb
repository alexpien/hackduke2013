class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user  
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]  
  end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(signin_url, notice:'Incorrect User') unless current_user==@user
    end

def signed_in
	if current_user.nil?
		store_location
  	 	redirect_to signin_url, notice: "Please sign in."
	end
end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  helper_method :current_user, :correct_user, :signed_in


end
