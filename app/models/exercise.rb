class Exercise < ApplicationRecord
  has_rich_text :content
  has_one_attached :image
  has_many :workout_exercises, dependent: :destroy
  has_many :workouts, through: :workout_exercises 
  validate :image_validation
  enum muscle: { chest: 0, back: 1, aarms: 2, legs: 3, shoulders: 4, core: 5 }
  
  private

  def image_validation
    if image.attached? && !image.content_type.in?(%('image/jpeg image/png image/gif))
      errors.add(:image, 'must be a JPEG, PNG or GIF')
    end

    if image.attached? && image.byte_size > 5.megabytes
      errors.add(:image, 'size must be less than 5MB')
    end
  end
end
