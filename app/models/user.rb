class User < ApplicationRecord
  has_many :sent_applications, class_name: "JobApplication", foreign_key: "sender_id"
  has_many :job_applications, class_name: "JobApplication", foreign_key: "recipient_id"
  has_many :sent_invites, class_name: "Invite", foreign_key: "sender_id"
  has_many :invites, class_name: "Invite", foreign_key: "recipient_id"
  has_many :sent_reviews, class_name: "Review", foreign_key: "reviewer_id"
  has_many :reviews, class_name: "Review", foreign_key: "reviewee_id"
  has_many :posts, dependent: :destroy
  has_many :skills
  has_one  :address, dependent: :destroy
  accepts_nested_attributes_for :address

  validates :user_type, presence: true
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  scope :freelancer, -> { where(user_type: "freelancer").order(name: :asc) }

  def sent_application_limit_reached?
    sent_applications.pending.count > 2
  end

  def employer?
    self.user_type == 'employer'
  end

  def freelancer?
    self.user_type == 'freelancer'
  end
end
