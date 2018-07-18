class User < ApplicationRecord
  has_many :job_posts

  validates :user_type, presence: true
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, presence: true

  def employer?
    self.user_type == 'Employer'
  end

end
