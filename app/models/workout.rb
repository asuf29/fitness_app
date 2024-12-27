class Workout < ApplicationRecord
  belongs_to :user

  has_one_attached :c_image

  validates :name, presence: true
end
