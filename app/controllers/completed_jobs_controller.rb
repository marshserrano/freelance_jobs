class CompletedJobsController < ApplicationController
  def index
    @completed_jobs = JobApplication.all
  end
end
