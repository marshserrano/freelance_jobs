class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @job_posts = current_user.job_posts
    @job_posts_paginate = @job_posts.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
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

  def correct_user
    @user = user
    redirect_to(root_url) unless current_user?(@user)
  end
end
