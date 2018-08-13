class Review < ApplicationRecord
  belongs_to :post, class_name: "Post", foreign_key: "post_id"
  belongs_to :reviewee, class_name: "User", foreign_key: "reviewee_id"
  belongs_to :reviewer, class_name: "User", foreign_key: "reviewer_id"
end
