class Post < ApplicationRecord
  enum status: [:open, :closed, :completed]

  belongs_to :user
  has_many :invites, dependent: :destroy
  has_many :job_applications, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  validates :budget, numericality: true
  validates :hours_of_work, numericality: true

  def open?
    self.status == 0
  end

  def open
    self.status == 0
  end
end
