class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#Log user and redirect to the user's show page
      log_in user
      redirect_to user
  	else
  		flash.now[:danger] = 'Invalid credentials' #Not quite right
  		render 'new'
  	end
  end

  def destroy
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
