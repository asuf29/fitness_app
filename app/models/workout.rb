class Workout < ApplicationRecord
  belongs_to :user

  has_one_attached :cover

  validates :name, presence: true
end
