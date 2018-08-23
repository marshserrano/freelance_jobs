class AddJobApplicationToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :job_application, foreign_key: true
  end
end
