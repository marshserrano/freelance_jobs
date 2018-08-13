class Post < ApplicationRecord
  belongs_to :user
  has_many :invites, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  has_many :job_applications, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :budget, numericality: true
  validates :hours_of_work, numericality: true

  def open?
    self.status == 'open'
  end
end
