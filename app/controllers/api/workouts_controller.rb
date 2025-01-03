class Api::WorkoutsController < Api::ApplicationController
  def index
    workouts = Workout.highlighted
    
    render json: workouts.map { |workout| { id: workout.id, name: workout.name, user_id: workout.user_id } }
  end

  def show
    workout = Workout.find_by(id: params[:id])
    if workout
      exercises = workout.workout_exercises.map { |workout_exercise| {
        id: workout_exercise.exercise.id,  
        name: workout_exercise.exercise.name,  
        set: workout_exercise.set,
        rep: workout_exercise.rep,  
        duration: workout_exercise.duration  
      }}

      render json: {
        id: workout.id,
        name: workout.name,
        exercises: exercises
      }, status: :ok
    else
      render json: { error: "Workout not found" }, status: :not_found
    end
  end
end
