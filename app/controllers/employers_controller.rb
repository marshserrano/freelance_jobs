class EmployersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @employers = User.where(user_type: 'Employer')
  end

  def show
  end

  private

  def set_user
      @user = User.find(params[:id])
  end
end
