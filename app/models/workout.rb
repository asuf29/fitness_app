class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  has_one_attached :c_image
  accepts_nested_attributes_for :workout_exercises, allow_destroy: true

  validates :name, presence: true
end
