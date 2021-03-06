class User < ActiveRecord::Base
  has_many :campers, :foreign_key => 'user_id'
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  def add_a_camper(camper)
    unless self.campers.include?(camper)
      self.campers << camper
    end
  end
end
