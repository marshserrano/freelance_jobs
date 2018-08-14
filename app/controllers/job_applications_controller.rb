class JobApplicationsController < ApplicationController

  def index
    @job_applications = JobApplication.all
  end

  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = current_user.sent_applications.new(job_application_params)
    if current_user.sent_application_limit_reached?
      flash[:danger] = "Application should be not more than 3. Please delete one first."
    else
      @post = Post.find_by(id: job_application_params[:post_id])
      @job_application.recipient_id = @post.user_id
      if @job_application.save
        flash[:success] = "Job application sent"
      else
        render 'new'
      end
    end
    redirect_to job_applications_path
  end

  def accept
    @job_application = JobApplication.find_by(id: params[:id])
    @post = Post.where(id: @job_application.post_id)
    @job_application.update(status: 1)
    @post.update(status: 1)
    flash[:success] = "Applicant hired"
    redirect_to job_applications_path
  end

  def destroy
    @job_application = JobApplication.find_by(id: params[:id])
    @job_application.destroy
    flash[:success] = "Job application deleted"
    redirect_to job_applications_path
  end

  private

  def job_application_params
    params.require(:job_application).permit(:content, :status, :sender_id,
                                    :recipient_id, :post_id)
  end
end
