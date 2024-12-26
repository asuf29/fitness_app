class User < ApplicationRecord
  enum role: { member: 0, admin: 1 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  has_one_attached :profile_picture
  has_many :workouts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def full_name
    "#{first_name} #{last_name}"
  end
end