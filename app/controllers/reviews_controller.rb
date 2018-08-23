class ReviewsController < ApplicationController
  before_action :set_job_application
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.sent_reviews.new(review_params)
    if current_user.employer?
      @review.reviewee_id = @job_application.sender_id
    else
      @review.reviewee_id = @job_application.recipient_id
    end
    if @review.save
      flash[:success] = "Review added"
      redirect_to completed_jobs_path
    else
      flash[:danger] = "You can't add a review more than once"
      redirect_to completed_jobs_path
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :reviewer_id,
                                   :reviewee_id, :job_application_id)
  end

  def set_job_application
    @job_application = JobApplication.find(params[:job_application_id])
  end

  def set_review
    @review = job_application.reviews.find(params[:id])
  end
end
