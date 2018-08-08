class FreelancersController < ApplicationController

  def index
    @freelancers = User.where(user_type: 'Freelancer')
  end

  def show
    @freelancer = User.find(params[:id])
    @completed_jobs = Message.where("sender_id = ? OR recipient_id = ? OR recipient_id = ? OR sender_id = ?",
                                  @freelancer, @recipient, @freelancer, @sender)
  end

end
