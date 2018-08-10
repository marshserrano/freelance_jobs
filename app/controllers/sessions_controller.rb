class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if current_user.employer?
        redirect_to users_path
      else
        redirect_to applications_path
      end
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
      session.delete :user_id
      redirect_to root_url, notice: "Logged out"
  end
end
