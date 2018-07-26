class FreelancersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @freelancers = User.where(user_type: 'Freelancer')
  end

  def show
    @messages = Message.all.where("sender_id = ? OR recipient_id = ? OR recipient_id = ? OR sender_id = ?",
                                  current_user.id, @recipient, current_user.id, @sender)
  end

  private

  def set_user
      @user = User.find(params[:id])
  end
end
