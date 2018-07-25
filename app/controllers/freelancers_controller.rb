class FreelancersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @freelancers = User.where(user_type: 'Freelancer')
  end

  def show
  end

  private

  def set_user
      @user = User.find(params[:id])
  end
end
