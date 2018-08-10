class FreelancersController < ApplicationController

  def index
    @freelancers = User.freelancer
  end

  def show
    @freelancer = User.find(params[:id])
    @completed_jobs = Message.sender_or_reciever(current_user.id, current_user.id)
  end

end
