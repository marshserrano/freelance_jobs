class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @job_posts = current_user.job_posts
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    # @pass_form = ChangePasswordForm.new(current_user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def set_user
      @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_type, :name, :email,
                                 :password, :password_confirmation,
                                 :company_name, :job_title, :location,
                                 :brief_intro, :summary, :skills, :rate)
  end
end
