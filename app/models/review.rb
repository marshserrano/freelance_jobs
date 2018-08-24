class Review < ApplicationRecord
  belongs_to :job_application, class_name: "JobApplication", foreign_key: "job_application_id"
  belongs_to :reviewee, class_name: "User", foreign_key: "reviewee_id"
  belongs_to :reviewer, class_name: "User", foreign_key: "reviewer_id"
  default_scope -> { order(created_at: :desc) }

  validates_uniqueness_of :reviewer_id, scope: :job_application_id
end
