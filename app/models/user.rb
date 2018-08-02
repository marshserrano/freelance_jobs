class User < ApplicationRecord
  has_many :reviews, class_name: "Review", foreign_key: "reviewee_id"
  has_many :sent_reviews, class_name: "Review", foreign_key: "reviewer_id"
  has_many :messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :job_posts, dependent: :destroy
  #dependent: :destroy - for the dependent microposts to be destroyed
  #when the user itself is destroyed
  before_update :check_password

  validates :user_type, presence: true
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  def employer?
    self.user_type == 'Employer'
  end

  def freelancer?
    self.user_type == 'Freelancer'
  end

  private

    def check_password
      is_ok = self.password.nil? || self.password.empty? || self.password.length >= 6
      self.errors[:password] << "Password is too short (minimum is 6 characters)" unless is_ok
      is_ok
      # The callback returns a Boolean value indicating success;
      # if it fails, the save is blocked
    end
end
