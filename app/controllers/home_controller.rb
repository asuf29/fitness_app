class HomeController < ApplicationController
  def index
    @highlighted_workouts = Workout.where(highlighted: true)
  end
end
