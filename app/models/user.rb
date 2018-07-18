class User < ApplicationRecord
  has_many :job_posts, dependent: :destroy
  #dependent: :destroy - for the dependent microposts to be destroyed
  #when the user itself is destroyed

  validates :user_type, presence: true
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, presence: true

  def employer?
    self.user_type == 'Employer'
  end

end
