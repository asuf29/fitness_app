class HomeController < ApplicationController
  def index
    @highlighted_workouts = Workout.highlighted
  end
end
