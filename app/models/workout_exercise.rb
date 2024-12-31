class WorkoutExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout

  validates :set, :rep, :duration, presence: true
end
