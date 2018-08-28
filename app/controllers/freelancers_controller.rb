class FreelancersController < ApplicationController
  def show
    @freelancer = User.find(params[:id])
  end
end
