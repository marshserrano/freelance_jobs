class ReviewsController < ApplicationController
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
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :reviewer_id,
                                   :reviewee_id, :job_post_id)
  end
end
