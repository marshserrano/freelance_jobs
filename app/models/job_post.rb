class JobPost < ApplicationRecord
  belongs_to :user
  # has_many :reviews, dependent: :destroy
  # default_scope -> { order(created_at: :desc) }
  has_many :messages, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :budget, numericality: true
  validates :hours_of_work, numericality: true

  def open?
    self.status == 'open'
  end
end
