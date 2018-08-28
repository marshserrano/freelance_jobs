class CompletedJobsController < ApplicationController
  def index
    if is_employer
      @completed_jobs = current_user.job_applications.completed
    else
      @completed_jobs = current_user.sent_applications.completed
    end
  end
end
