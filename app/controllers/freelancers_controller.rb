class FreelancersController < ApplicationController
  def index
    @freelancer = User.freelancer
  end
  def show
    @freelancer = User.find(params[:id])
  end
end
