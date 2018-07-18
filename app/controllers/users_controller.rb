class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :show]

  def index
    @job_posts = JobPost.all
  end

  def show
    @user = User.find(params[:id])
    if @user.employer?
      render 'users/employer'
    else
      render 'users/freelancer'
    end
    @user.job_posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_type, :name, :email,
                                 :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
